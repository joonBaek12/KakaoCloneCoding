//
//  NewCategoryCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/21.
//

import UIKit

import SnapKit
import Then

//MARK: -NewCategoryCollectionViewCell
class NewCategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    private let categoryImageContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let categoryImageView = UIImageView()
    private let nameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let numberLabel = UILabel().then {
        $0.text = "1/100"
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray2
    }

    //MARK: - Variables
    static let identifier = "NewCategoryCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions
extension NewCategoryCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.adds(
            [
                categoryImageContainerView,
                categoryImageView,
                nameLabel,
                numberLabel,
                lineView
            ]
        )
        
        categoryImageContainerView.add(categoryImageView)
        
        categoryImageContainerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        categoryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.categoryImageView).offset(22)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(45)
        }
        
        lineView.snp.makeConstraints {
            $0.centerY.equalTo(self.contentView.snp.bottom)
            $0.height.equalTo(1)
        }
    }
    //MARK: - General Helpers
    
    
}
