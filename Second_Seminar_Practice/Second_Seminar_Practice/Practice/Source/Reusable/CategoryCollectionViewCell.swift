//
//  CategoryCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/20.
//

import UIKit

import SnapKit
import Then

//MARK: - CategoryCollectionViewCell
final class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components

    private let colorView = UIView().then {
        $0.setRounded(radius: 14.5)
    }
    private let nameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let numberLabel = UILabel()
    private let editButton = UIImageView().then {
        $0.image = UIImage(named: "icon_edit")
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    //MARK: - Variables
    static let identifier = "CategoryCollectionViewCell"
    
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
extension CategoryCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.adds(
            [
                colorView,
                nameLabel,
                numberLabel,
                editButton,
                lineView
            ]
        )
        
        colorView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(29)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.colorView.snp.trailing).offset(22)
            $0.centerY.equalToSuperview()
        }
        
        editButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-12)
            $0.width.height.equalTo(28)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.editButton.snp.leading)
        }
           
        lineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    //MARK: - General Helpers
    func databind(model: Category) {
        colorView.backgroundColor = model.color
        nameLabel.text = model.name
        numberLabel.text = "\(model.count)/100"
        
        
        if model.name == "기본 카테고리" {
            editButton.isHidden = true
        } else {
            editButton.isHidden = false
        }
    }
}
