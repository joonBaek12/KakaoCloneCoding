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
    
    
    //MARK: - UIComponents
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
//        $0.addTarget(self, action: #selector(touchupLogoutButton), for: .touchUpInside)
    }
    
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
    
    private let nameLabel = UILabel().then {
        $0.text = "백준"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "joonbaek12@gmail.com"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .systemGray5
    }
    
    private let profileLineView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    //MARK: - Variables


    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}

//MARK: - Extentions

extension PlusViewController{
    
    //MARK: - LayoutHelpers
    
    private func layout() {

        view.adds(
            [
                logoutButton,
                plusContainerView,
                plusLabel,
                settingButton,
                profileContainerView,
                profileImageView,
                nameLabel,
                emailLabel,
                profileLineView
            ]
        )
        
        

//        logoutButton.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
//            $0.width.equalTo(40)
//            $0.height.equalTo(20)
            
        }
    }

    // MARK: - GeneralHelpers

    // MARK: - ActionHelpers

//    @objc
//    private func touchupLogoutButton() {
//        if let rootNavi = self.navigationController?.tabBarController?.navigationController {
//            rootNavi.popToRootViewController(animated: true)
//        }
//        self.navigationController?.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
}

