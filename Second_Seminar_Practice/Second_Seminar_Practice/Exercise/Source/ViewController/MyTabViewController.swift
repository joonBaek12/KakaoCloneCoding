//
//  MyTabViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/03.
//

import UIKit

import SnapKit
import Then

//MARK: - MyTabViewController

final class MyTabViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    
    private let closeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btnClose"), for: .normal)
        $0.addTarget(self, action: #selector(touchupCloseButton), for: .touchUpInside)
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")//사이즈?
    }
    
    private let myNameLabel = UILabel().then {
        $0.text = "백준"
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .white
    }
    
    private let profileLineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let editButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btnEdit"), for: .normal)
    }
    
    private let chattingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btnChatting"), for: .normal)
    }
    
    private let kakaoStoryButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btnKakaoStory"), for: .normal)
    }
    
    
    
    //MARK: - Variables
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        layout()
    }
    
}

//MARK: - Extentions

extension MyTabViewController {
    
    //MARK: - LayoutHelpers
    private func layout() {
        
        view.adds([closeButton, profileImageView, myNameLabel, profileLineView,editButton,kakaoStoryButton,chattingButton])
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(13)
            $0.height.equalTo(14)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(514)
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        
        myNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(8)
        }
        
        profileLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.myNameLabel.snp.bottom).offset(42)
            $0.width.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }

        editButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileLineView).offset(12)
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        chattingButton.snp.makeConstraints {
            $0.trailing.equalTo(self.editButton.snp.leading)
            $0.centerY.equalTo(self.editButton)
            $0.height.equalTo(self.editButton)
        }
        
        kakaoStoryButton.snp.makeConstraints {
            $0.leading.equalTo(self.editButton.snp.trailing)
            $0.centerY.equalTo(self.editButton)
            $0.height.equalTo(self.editButton)
        }
    
    }
    // MARK: - GeneralHelpers
        
    // MARK: - ActionHelpers

    @objc
    private func touchupCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }


}
