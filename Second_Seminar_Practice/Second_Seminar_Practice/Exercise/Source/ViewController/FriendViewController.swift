//
//  FriendViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/15.
//

import UIKit

import SnapKit
import Then

//MARK: - FriendViewController

final class FriendViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    private lazy var appTableView: UITableView = {
        let tableView = UITableView().then {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
        return tableView
    }()
    
    //MARK: - UIComponents
    
    //MARK: - Variables
    
    
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        layout()
//        addGesture()
        
    }
    
    
    
}


//MARK: - Extentions

extension FriendViewController {
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        view.adds(appTableView)
        
        appTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
//            $0.height.equalTo(106 )
        }
    }
    
    //MARK: - GeneralHelpers
    
    private func register() {
        appTableView.register(AppTableViewCell.self, forCellReuseIdentifier: AppTableViewCell.identifier)
    }
    
    private func configDelegate() {
        appTableView.delegate = self
        apptableview.dataSource = self
    }
    
    
    //MARK: - ActionHelpers
    
//    private func addGesture() {
//        let gesture = UITapGestureRecognizer()
//        gesture.addTarget(self, action: #selector(touchupProfileButton))
//        profileMainImageView.addGestureRecognizer(gesture)
//    }
//
//    //    self.navigationController?.navigationBar.isHidden = true
//
//
//    @objc
//    private func touchupProfileButton() {
//        let myTabVC = MyTabViewController()
//        myTabVC.modalPresentationStyle = .overFullScreen
//        self.present(myTabVC, animated:  true, completion: nil)
//    }
//
//}

    //MARK: - UItableViewDelegate
    
    
    
