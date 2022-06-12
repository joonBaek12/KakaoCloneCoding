//
//  ScrollViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/11.
//

import UIKit

import SnapKit
import Then

//MARK: - FirstViewController

final class ScrollViewPracticeViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    
    private let containerView = UIScrollView().then {
        $0.backgroundColor = .clear
        $0.bounces = false
    }
    
    private let firstView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let secondView = UIView().then {
        $0.backgroundColor = .orange
    }
    
    private let thirdView = UIView().then {
        $0.backgroundColor = .yellow
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

extension ScrollViewPracticeViewController {
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        view.add(containerView)
        containerView.adds([firstView, secondView, thirdView])
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
//            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(400)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(self.firstView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(400)
        }
        
        thirdView.snp.makeConstraints {
            $0.top.equalTo(self.secondView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview()
        }
    }
    // MARK: - GeneralHelpers
    
    // MARK: - ActionHelpers
    
}

