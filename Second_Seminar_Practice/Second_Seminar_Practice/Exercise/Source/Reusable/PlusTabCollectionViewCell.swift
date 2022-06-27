//
//  PlusTabCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/27.
//

import UIKit
import SnapKit
import Then

//MARK: - PlusTabCollectionViewCell

final class PlusTabCollectionViewCell: UICollectionViewCell {

    
    //MARK: - components
    
    private let buttonImageContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let buttonImageView = UIImageView()
    private let buttonNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    //MARK: - Variables
    
    static let identifier = "PlusTabCollectionViewCell"
    
    //MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Extentions

extension PlusTabCollectionViewCell {
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.adds(
            [
                buttonImageContainerView,
                buttonImageView,
                buttonNameLabel
            ]
        )
        
        let width = (UIScreen.main.bounds.width - 19*5)/5
        buttonImageContainerView.add(buttonImageView)
        buttonImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(width)
        }
        
        buttonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.centerX.equalToSuperview()
        }
        
        buttonNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.buttonImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    //MARK: - General Helpers
    
    func databind(buttonImage: String, buttonName: String) {
        buttonImageView.image = UIImage(named:  buttonImage)
        buttonNameLabel.text = buttonName
    }
}
