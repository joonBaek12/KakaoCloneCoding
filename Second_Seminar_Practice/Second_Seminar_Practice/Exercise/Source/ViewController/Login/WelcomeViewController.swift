//
//  WelcomeViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/09.
//

import UIKit

import SnapKit
import Then

//MARK: - WelcomeViewController

final class WelcomeViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    
    private let WelcomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let ConfirmButton = UIButton().then {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
            $0.backgroundColor = .yellow
            $0.addTarget(self, action: #selector(touchupConfirmButton), for: .touchUpInside)
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

extension WelcomeViewController{
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        
        view.adds(
            [
             WelcomeLabel,
             ConfirmButton
            ]
        )
        
        WelcomeLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        ConfirmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.top.equalTo(self.WelcomeLabel.snp.bottom).offset(50)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - GeneralHelpers
    
    func dataBind(email: String) {
        WelcomeLabel.text = email
    }
    
    // MARK: - ActionHelpers
    
    @objc
    private func touchupConfirmButton() {
        let tabbarVC = TabBarViewController()

        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(tabbarVC, animated: true)
    }
}
