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
    
    private lazy var newCategoryCollectionView: UICollectionView = {
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
    
    //MARK: - Variables
    let tabBarImageNames: [String] =
    [
        "Frame",
        "Frame1"
    ]
    
    let defaultCategoryNames: [String] =
    [
        "새 카테고리",
        "기본카테고리"
    ]
    
    //MARK: - UIComponents
    private let profileContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "Ellipse 402")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "김카핀"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private let profileTabImage = UIImageView().then {
        $0.image = UIImage(named: "Rectangle 1354")
    }
    
    
    //MARK: - Variables
    var categoryTabSelected: Bool = true
    
    var categoryList:[] = [
        
    ]
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
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
                profileImage,
                nameLabel,
                profileTabImage,
                tabCollectionView,
                categoryCollectionView,
                
            ]
        )
        
        let width = (UIScreen.main.bounds.width)
        
        profileContainerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(300)
        }
        
        profileImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileImage.snp.bottom).offset(16)
        }
        
        profileTabImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(19)
            $0.width.equalTo(258)
            $0.height.equalTo(32)
        }
    }
    
    //MARK: - General Helpers
    private func register() {
        tabCollectionView.register(MyPageTabCollectionViewCell.self, forCellWithReuseIdentifier: MyPageTabCollectionViewCell.identifier)
        categoryCollectionView.register(NewCategoryCollectionViewCell.self,forCellWithReuseIdentifier: NewCategoryCollectionViewCell.identifier)
        
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
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        <#code#>
    }
}

//MARK: - UICollectionViewDataSource
extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
        
        relayout()
        tabCollectionView.reloadData()
        categoryCollectionView.reloadData()
    }
}
