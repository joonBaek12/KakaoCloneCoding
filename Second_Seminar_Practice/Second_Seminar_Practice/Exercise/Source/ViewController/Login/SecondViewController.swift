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
    
    private let emailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("뒤로가기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
        $0.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
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

extension SecondViewController {
    
    //MARK: - LayoutHelpers
    
    private func layout() { view.adds([emailLabel,backButton])
        
        emailLabel.snp.makeConstraints {
            $0.center.equalToSuperview()//xy통합
        }
            
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.emailLabel.snp.bottom).offset(15)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
      

        
    }
    
    //MARK: - GeneralHelpers

    func dataBind(email: String) {
        emailLabel.text = email
    }
    
    //MARK: - ActionHelpers
    
    @objc
    private func touchupBackButton() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
