//
//  HomeViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/31.
//

import UIKit

import SnapKit
import Then

//MARK: - TabBarViewController
class HomeViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    //MARK: - UIComponents
    
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.textColor = .black
    }
    
    //    private let profileImageContainerView = UIView().then {
    //        $0.backgroundColor = .clear
    //    }
    
    private let profileMainImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
        //        $0.addTarget(self, action: #selector(touchupProfileButton),for: .touchUpInside)
    }
    
    private let profileButton = UIButton().then {
        $0.setTitle("프로필", for: .normal)
        $0.setTitleColor(.clear, for: .normal)
        $0.addTarget(
            self,
            action: #selector(touchupProfileButton),
            for: .touchUpInside
        )
    }

    //MARK: - Variables
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        layout()
        addGesture()
    }
}

//MARK: - Extentions
extension HomeViewController {
    
    //MARK: - LayoutHelpers
    private func layout() {
        view.adds(
            [friendLabel,
             //         profileImageContainerView,
             profileMainImageView,
             profileButton
            ]
        )
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
        }
        
        profileMainImageView.snp.makeConstraints {
            $0.top.equalTo(self.friendLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.friendLabel.snp.leading)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        profileButton.snp.makeConstraints {
            $0.edges.equalTo(self.profileMainImageView)
        }
        
    }
    
    //MARK: - GeneralHelpers
    
    
    //MARK: - ActionHelpers
    private func addGesture() {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(touchupProfileButton))
        profileMainImageView.addGestureRecognizer(gesture)
    }
    
    //    self.navigationController?.navigationBar.isHidden = true
    
    
    @objc
    private func touchupProfileButton() {
        let myTabVC = MyTabViewController()
        myTabVC.modalPresentationStyle = .overFullScreen
        self.present(myTabVC, animated:  true, completion: nil)
    }
    
}
