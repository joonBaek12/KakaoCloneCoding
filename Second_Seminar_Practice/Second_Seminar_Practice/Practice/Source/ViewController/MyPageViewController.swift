//
//  MyPageViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/20.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

//MARK: - MyPageViewController
class MyPageViewController: UIViewController {
    
    //MARK: - Lazy Components
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        return collectionview
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        return collectionView
    }()
    
    //MARK: - UIComponents
    private let profileContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let closeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btnCloseBlack"), for: .normal)
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "Ellipse402")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "김카핀"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private let menuContainerView = UIView().then {
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .clear
        $0.layer.borderColor = 0xC4C4C4.color.cgColor
        $0.layer.borderWidth = 1
    }
    
    private let separatorView = UIView().then {
        $0.backgroundColor = 0xC4C4C4.color
    }
    
    private let MBTIButton = UIButton().then {
        $0.setTitle("WBFJ", for: .normal)
        $0.setTitleColor(0xA77145.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        $0.backgroundColor = .clear
    }
    
    private let editButton = UIButton().then {
        $0.setTitle("프로필 편집", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        $0.backgroundColor = .clear
    }
    
    
    //MARK: - Variables
    
    var categoryTabSelected: Bool = true
    
//    var categoryList: [Category] = [
//        Category(color: .systemRed, name: "카테고리 1", count: 2),
//        Category(color: .systemBlue, name: "카테고리 2", count: 5),
//        Category(color: .systemPink, name: "카테고리 3", count: 10),
//        Category(color: .systemGray, name: "카테고리 4", count: 25),
//        Category(color: .systemBrown, name: "카테고리 5", count: 40),
//        Category(color: .systemTeal, name: "카테고리 6", count: 5)
//    ]
    
    var categoryList: [Category] = []
    let tabBarImageNames: [String] =
    [
        "Frame",
        "Frame1"
    ]
    
    var defaultCategory = Category(color: .black, name: "기본 카테고리", count: 1)
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        register()
        configDelegate()
        layout()
        relayout()
    }
}

//MARK: - Extensions
extension MyPageViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.adds(
            [
                profileContainerView,
                tabCollectionView,
                categoryCollectionView,
            ]
        )
        
        profileContainerView.adds(
            [
                closeButton,
                profileImage,
                nameLabel,
                menuContainerView
            ]
        )
        
        profileContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(371)
        }
        
        profileImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileImage.snp.bottom).offset(16)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(30)
        }
        
        menuContainerView.adds(
            [
                separatorView,
                MBTIButton,
                editButton
            ]
        )
        
        menuContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(19)
            $0.width.equalTo(258)
            $0.height.equalTo(32)
        }
        
        MBTIButton.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.trailing.equalTo(self.menuContainerView.snp.centerX).offset(-0.5)
        }
        
        editButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(self.menuContainerView.snp.centerX).offset(0.5)
        }
        
        separatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(13)
        }
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.profileContainerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
       
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.tabCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(0)
        }
    }
    
    private func relayout() {
        let count = CGFloat(categoryList.count)
        categoryCollectionView.snp.updateConstraints {
            $0.height.equalTo(count * 58 + 58 * 2 + 10)//새카테고리+기본카테고리
        }
    }
    
    //MARK: - General Helpers
//    private func config() {
//
//    }
    
    private func register() {
        tabCollectionView.register(MyPageTabCollectionViewCell.self, forCellWithReuseIdentifier: MyPageTabCollectionViewCell.identifier)
        
        categoryCollectionView.register(NewCategoryCollectionViewCell.self,forCellWithReuseIdentifier: NewCategoryCollectionViewCell.identifier)

        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func configDelegate() {
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    //MARK: - ActionHelpers
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width)
        
        if collectionView == tabCollectionView {
            return CGSize(width: (width / 2), height: 60)
        } else {
            return CGSize(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tabCollectionView {
            return 7
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tabCollectionView {
            return 7
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tabCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tabCollectionView {
            return 2
        } else {
            if categoryTabSelected {
                return categoryList.count + 2
            } else{
                return 1
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabCollectionView {
        guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageTabCollectionViewCell.identifier, for: indexPath)
                as?MyPageTabCollectionViewCell else {return UICollectionViewCell()}
        
        tabCell.databind(index: indexPath.item, categoryTabSelected: categoryTabSelected )
        return tabCell
        } else {
            if categoryTabSelected {
                if indexPath.item == 0 {
                    guard let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCategoryCollectionViewCell.identifier, for: indexPath) as? NewCategoryCollectionViewCell else {return UICollectionViewCell()}
                    
                    return addCell
                }
                else if indexPath.item == 1 {
                    guard let categoryCell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                            as? CategoryCollectionViewCell else {return UICollectionViewCell()}
                    
                    categoryCell.databind(model: defaultCategory)
                    return categoryCell
                }
                else {
                    guard let categoryCell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                            as? CategoryCollectionViewCell else {return UICollectionViewCell()}
                    
                    categoryCell.databind(model: categoryList[indexPath.item - 2])
                    return categoryCell
                }
            } else {
               return UICollectionViewCell()
            }
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionview == tabCollectionView {
//            if categoryTabSelected {
//                if indexPath.item == 0 {
//
//                } else {
//                    categoryTabSelected = false
//
//                }
//            }
//        }
//
//        relayout()
//        tabCollectionView.reloadData()
//        categoryCollectionView.reloadData()
//    }
}
