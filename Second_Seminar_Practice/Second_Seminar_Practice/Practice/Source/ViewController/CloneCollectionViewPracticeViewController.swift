//
//  CollectionViewPracticeCopyViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/11.
//

import UIKit

import SnapKit
import Then

final class CloneCollectionViewPracticeViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var appTableView: UITableView = {
        let tableView = UITableView().then {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
        return tableView
    }()
    
    //MARK: - Variables
    
    //MARK: - LifeCycles

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
}

//MARK: - Extentions
extension CloneCollectionViewPracticeViewController {

    //MARK: - Layout Helplers
    
    private func layout() {
        view.add(appTableView)
        
        appTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
//            $0.height.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
        }
    }

    //MARK: - General Helpers

//MARK: - UITableViewDelagate

//MARK: - UITableViewDataSource


}
