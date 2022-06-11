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
        $0.addTarget(self, action: #selector(touchupLogoutButton), for: .touchUpInside)
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
            ]
        )

        logoutButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            
        }
    }

    // MARK: - GeneralHelpers

    // MARK: - ActionHelpers

    @objc
    private func touchupLogoutButton() {
        let firstVC = FirstViewController()
        
        self.navigationController?.navigationBar.isHidden = true//'<back버튼' 가리기
        self.navigationController?.pushViewController(firstVC,animated: true)
    }
}

