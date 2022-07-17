//
//  SecondMemberCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/10.
//

import UIKit
import SnapKit
import Then

//MARK: - SecondMemberCollectionViewCell
final class SecondMemberCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    private let memberImageContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let memberImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let infoLabel = UILabel().then {
        $0.textColor = . black
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    private let remainingLabel = UILabel().then {
        $0.textColor = .systemRed
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    private let matchButton = UIButton().then {
        $0.setTitle("수강권 발급하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
        $0.backgroundColor = .cyan
        $0.layer.cornerRadius = 10.0
    }
    
    //MARK: - Variables
    static let identifier = "SecondMemberCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

//MARK: - Extentions
extension SecondMemberCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 6
        contentView.adds(
            [
                memberImageContainerView,
                nameLabel,
                infoLabel,
                remainingLabel,
                matchButton
            ]
        )
        memberImageContainerView.add(memberImageView)
        
        memberImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
            $0.width.height.equalTo(48)
        }
        
        memberImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(memberImageView.snp.trailing).offset(11)
        }
        
        infoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        
        remainingLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(infoLabel.snp.trailing).offset(6)
        }
        
        matchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-14)
            $0.width.equalTo(93)
            $0.height.equalTo(28)
            
        }
    }
    
    //MARK: - General Helpers
    
    func databind(model: Profile) {
        nameLabel.text = model.name
        infoLabel.text = "(\(model.age)세, \(model.gender))"
        memberImageView.image = UIImage(named: model.profileImage)
        remainingLabel.text = "잔여 \(model.remaining)회"
    }
}

