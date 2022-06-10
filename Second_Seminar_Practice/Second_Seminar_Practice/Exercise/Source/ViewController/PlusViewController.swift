//
//  PlusViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/31.
//

import UIKit

class PlusViewController: UIViewController {

    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .black)
        $0.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
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

extension PlusViewController{
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        
        view.adds(
            [
                touchupBackButton()
            ]
        )
        touchupBackButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
        
    }
    
    // MARK: - GeneralHelpers
        
    // MARK: - ActionHelpers
    
    @objc
    private func touchupBackButton() {
       
        self.navigationController?.navigationBar.isHidden = true//'<back버튼' 가리기
        self.navigationController?.popViewController(animated: true)
    }
//        welcomeVC.modalPresentationStyle = .overFullScreen
//        self.present(welcomeVC, animated: true, completion: nil)
//    }
}

