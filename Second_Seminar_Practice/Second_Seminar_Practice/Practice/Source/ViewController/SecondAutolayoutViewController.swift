//
//  SecondAutolayoutViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/17.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - SecondAutolayoutViewController

final class SecondAutolayoutViewController: UIViewController {
    
    // MARK: - Lazy Components
    
    
    
    // MARK: - UIComponents
    
    private let dateLabel = UILabel().then {
        $0.text = "4월 10일 토요일"
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = 0x8A8A8F.color
    }
    
    private let todayLabel = UILabel().then {
        $0.text = "투데이"
        $0.font = .systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .white
    }
    
    private let profileImangeContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let profileImangeView = UIImageView().then {
        $0.image = UIImage(named: "Joon")
    }
    
    private let mainContainerView = UIView()
    private let bannerImangeView = UIImageView().then {
        $0.image = UIImage(named: "appstore_banner1")
    }
       
    private let firstLabel = UILabel().then {
        $0.text = "고르고 골랐어요"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = 0x7E90A3.color
    }
    
    private let secondLabel = UILabel().then {
        $0.text = "이번주 추천 앱"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .white
    }
    
    private let thirdLabel = UILabel().then {
        $0.text = "새로 나온 앱과 업데이트를 모았습니다"
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .white
    }
    
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
}

// MARK: - Extensions

extension SecondAutolayoutViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.adds(
            [
                dateLabel,
                todayLabel,
                profileImangeContainerView,
                mainContainerView
            ]
        )
        
        profileImangeContainerView.addSubview(profileImangeView)
        mainContainerView.adds(
            [
                bannerImangeView,
                firstLabel,
                secondLabel,
                thirdLabel
            ]
        )
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(self.dateLabel.snp.bottom).offset(2)
            $0.leading.equalTo(self.dateLabel)
        }
        
        profileImangeContainerView.snp.makeConstraints {
            $0.centerY.equalTo(self.todayLabel)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.width.height.equalTo(30)
        
        }
        
        profileImangeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width - 40
        mainContainerView.snp.makeConstraints {
            $0.top.equalTo(self.todayLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(width)
        }
        
        bannerImangeView.snp.makeConstraints {
            $0.edges.equalTo(self.mainContainerView)//edges.equalToSuperview
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainContainerView).offset(19)
            $0.leading.equalTo(self.mainContainerView).offset(13)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(self.firstLabel.snp.bottom).offset(7)
            $0.leading.equalTo(self.firstLabel)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)//짧게
            $0.leading.equalTo(self.mainContainerView.snp.leading).offset(20)
        }
        
    }
    
    // MARK: - General Helpers
    
    
}
