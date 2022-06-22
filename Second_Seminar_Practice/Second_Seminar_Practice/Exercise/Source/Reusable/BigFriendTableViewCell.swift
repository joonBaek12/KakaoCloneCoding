//
//  FriendTableViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/15.
//

import UIKit

import SnapKit
import Then

//MARK: - BigFriendTableViewCell

final class BigFriendTableViewCell: UITableViewCell {

    //MARK: - lazy Components
    
    //MARK: - components
    private let profileImageContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let underBarView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    //MARK: - Variables
    
    static let identifier = "BigFriendTableViewCell"
    
    //MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: FriendTableViewCell.identifier)// .default 색깔 차이 등
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Extentions
 
extension BigFriendTableViewCell {

    //MARK: - Layout Helpers
    private func layout() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.adds(
            [
                profileImageContainerView,
                nameLabel,
                descriptionLabel,
                underBarView
            ]
        )
        
        profileImageContainerView.add(profileImageView)
        
        profileImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        profileImageView.snp.makeConstraints {
            $0.edges.equalTo(profileImageView)//superview?
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImageContainerView).offset(10)
            $0.leading.equalTo(self.profileImageContainerView.snp.trailing).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(9)
            $0.leading.equalTo(self.nameLabel)
        }
        
        underBarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
    }
    //MARK: - General Helpers

    func dataBind(model:ProfileDataModel) {
        profileImageView.image = UIImage(named: model.profileImageName)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }
}
