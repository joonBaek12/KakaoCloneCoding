//
//  MyPageTabCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/21.
//

import UIKit

import SnapKit
import Then

//MARK: - MyPageTabCollectionViewCell
final class MyPageTabCollectionViewCell: UICollectionViewCell {
    
    //MARK: - components
    private let tabImageView = UIImageView().then {
        $0.image = UIImage(named: <#T##String#>)
    }
    private let underLineView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    //MARK: - Variables
    static let identifier = "MyPageTabCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)//찾아볼것
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
//MARK: - Extensions
extension MyPageTabCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.adds(
            [
                tabImageView,
                underLineView
            ]
        )
        
        tabImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    //MARK: - General Helpers
    func databind(tabBarImageNames: String) {
        tabImageView.image = UIImage(named: tabBarImageNames)
    }
}
