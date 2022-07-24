//
//  NewCategoryCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/21.
//

import UIKit

import SnapKit
import Then

//MARK: - NewCategoryCollectionViewCell
final class NewCategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    private let categoryImageContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let categoryImageView = UIImageView()
    private let nameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray6
    }

    //MARK: - Variables
    static let identifier = "NewCategoryCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        config()
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
                nameLabel,
                lineView
            ]
        )
        
        categoryImageContainerView.add(categoryImageView)
        
        categoryImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(29)
        }
        
        categoryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.categoryImageView.snp.trailing).offset(22)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    //MARK: - General Helpers
    
    private func config() {
        categoryImageView.image = UIImage(named: "newCategBtn")
        nameLabel.text = "새 카테고리"
    }
}
