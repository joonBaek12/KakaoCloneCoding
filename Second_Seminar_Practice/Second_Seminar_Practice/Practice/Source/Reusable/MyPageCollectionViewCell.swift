//
//  MyPageCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/20.
//

import UIKit

import SnapKit
import Then

//MARK: - MyPageCollectionViewCell
final class MyPageCollectionViewCell: UICollectionViewCell {
    
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
    
    private let editButton = UIImageView().then {
        $0.image = UIImage(named: "icon_edit")
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    //MARK: - Variables
    static let identifier = "MyPageCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame:  frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extentions
extension MyPageCollectionViewCell {
    
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
                editButton,
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
            $0.trailing.equalTo(self.editButton.snp.leading)
        }
        
        editButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-12)
            $0.width.height.equalTo(28)
        }
        
        lineView.snp.makeConstraints {
            $0.centerY.equalTo(self.contentView.snp.bottom)
            $0.height.equalTo(1)
        }
    }
    //MARK: - General Helpers
    func databind(index:String) {
        nameLabel.text = index
    }
}