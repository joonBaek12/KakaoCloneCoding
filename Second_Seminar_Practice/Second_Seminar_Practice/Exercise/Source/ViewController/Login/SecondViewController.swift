//
//  SecondViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/19.
//

import UIKit

import SnapKit
import Then

//MARK: - SecondViewController

final class SecondViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let emailTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        $0.textColor = .black
        $0.placeholder = "이메일 또는 전화번호"
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
        $0.clearButtonMode = .whileEditing
    }
    
    private let emailLineView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let passwordTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        $0.textColor = .black
        $0.placeholder = "비밀번호"
        $0.clearButtonMode = .whileEditing
    }
    
    private let passwordLineView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let passwordConfirmTextField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        $0.textColor = .black
        $0.placeholder = "비밀번호 확인"
        $0.clearButtonMode = .whileEditing
    }
    
    private let passwordConfirmLineView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let signupButton = UIButton().then {
        $0.setTitle("새로운 카카오 계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
        $0.backgroundColor = .gray
        $0.addTarget(self, action: #selector(touchupSignupButton), for: .touchUpInside)
    }
    
    //MARK: - Variables
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }
}

//MARK: - Extentions

extension SecondViewController{
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        
        view.adds(
            [
                titleLabel,
                subtitleLabel,
                emailTextField,
                emailLineView,
                passwordTextField,
                passwordLineView,
                passwordConfirmTextField,
                passwordConfirmLineView,
                signupButton
            ]
        )
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(62)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(29)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.top.equalTo(self.subtitleLabel.snp.bottom).offset(93)
            $0.height.equalTo(40)
        }
        
        emailLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.emailTextField.snp.bottom)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(40)
        }
        
        passwordLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.passwordTextField.snp.bottom)
            $0.height.equalTo(1)
        }
        
        passwordConfirmTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(12)
            $0.height.equalTo(40)
        }
        
        passwordConfirmLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.passwordConfirmTextField.snp.bottom)
            $0.height.equalTo(1)
        }
        
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.top.equalTo(self.passwordConfirmTextField.snp.bottom).offset(36)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - GeneralHelpers
        
    // MARK: - ActionHelpers
    
    @objc
    private func touchupSignupButton() {
        let welcomeVC = WelcomeViewController()
                if let emailString = emailTextField.text {
                    welcomeVC.dataBind(email: emailString)
                }
        self.navigationController?.navigationBar.isHidden = true//'<back버튼' 가리기
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
//        welcomeVC.modalPresentationStyle = .overFullScreen
//        self.present(welcomeVC, animated: true, completion: nil)
//    }
}
