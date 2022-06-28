//
//  PlusViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/31.
//

import UIKit

import SnapKit
import Then

//MARK: - PlusViewController

class PlusViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    private lazy var plusCollectionView:
    UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:  layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        return collectionView
    }()
    
    //MARK: - Components
    
    private let plusContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let plusLabel = UILabel().then {
        $0.text = "더보기"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.textColor = .black
    }
    
    private let settingButton = UIImageView().then {
        $0.image = UIImage(named: "settings")
    }
    
    private let profileContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
    }
    
    private let profileNameLabel = UILabel().then {
        $0.text = "백준"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    private let profileEmailLabel = UILabel().then {
        $0.text = "joonbaek12@gmail.com"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .systemGray
    }
    
    private let profileLineView = UIView().then {
        $0.backgroundColor = .systemGray
    }
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
        $0.addTarget(self, action: #selector(touchupLogoutButton), for: .touchUpInside)
    }
    
    //MARK: - Variables
    
    let iconImageNames: [String] = [
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon",
        "messageTabIcon"
        
    ]
    
    let iconTitleNames: [String] = [
        "메일",
        "캘린더",
        "서랍",
        "카카오콘",
        "메이커스",
        "선물하기",
        "이모티콘",
        "프렌즈",
        "쇼핑하기",
        "스타일",
        "주문하기",
        "멜론티켓",
        "게임",
        "멜론",
        "헤어샵",
        "전체서비스"
    ]
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        register()
        configDelegate()
        layout()
    }
}

//MARK: - Extentions

extension PlusViewController{
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        
        view.adds(
            [
                plusCollectionView,
                logoutButton,
                plusContainerView,
                profileContainerView,
                profileLineView
            ]
        )
        
        plusContainerView.adds(
            [
            plusLabel,
            settingButton
            ]
        )
        
        profileContainerView.adds(
            [
                profileImageView,
                profileNameLabel,
                profileEmailLabel
            ]
        )

        
        let width = (UIScreen.main.bounds.width - 19*5)/4
        
        plusContainerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(52)
        }
        
        plusLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.plusContainerView)
            $0.leading.equalToSuperview().offset(14)
        }
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(self.plusContainerView)
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(19)
        }
        
        profileContainerView.snp.makeConstraints {
            $0.top.equalTo(self.plusContainerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(63)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.profileContainerView)
            $0.leading.equalToSuperview().offset(13)
            $0.width.equalTo(43)
            $0.height.equalTo(42)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileContainerView).offset(13)
            $0.leading.equalToSuperview().offset(64)
        }
        
        profileEmailLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(self.profileNameLabel.snp.leading)
        }
        
        profileLineView.snp.makeConstraints {
            $0.top.equalTo(self.profileContainerView.snp.bottom)
            $0.leading.equalToSuperview().offset(18)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        plusCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.profileLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            //            $0.height.equalTo()
        }
        
        
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(self.plusCollectionView).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
    }

// MARK: - GeneralHelpers

    private func register() {
        plusCollectionView.register(
            PlusTabCollectionViewCell.self, forCellWithReuseIdentifier: PlusTabCollectionViewCell.identifier
        )
    }
    
    private func configDelegate() {
        plusCollectionView.delegate = self
        plusCollectionView.dataSource = self
        }
    }

//MARK: - UICollectionViewDelegateFlowLayout

extension PlusViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 19*5) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 19, bottom: 19, right: 19)
    }
}

//MARK: - UICollectionViewDataSource

extension PlusViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let plusCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlusTabCollectionViewCell.identifier, for: indexPath)as? PlusTabCollectionViewCell else {return UICollectionViewCell()}
        
        plusCell.databind(
            buttonImage: iconImageNames[indexPath.item%16],
            buttonName: iconTitleNames[indexPath.item%16]
        )
        
        return plusCell
    }
}

// MARK: - ActionHelpers

    @objc
    private func touchupLogoutButton() {
        if let rootNavi = self.navigationController?.tabBarController?.navigationController {
            rootNavi.popToRootViewController(animated: true)
        }
        self.navigationController?.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }


