//
//  FirstMemberTableViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/10.
//

import UIKit
import SnapKit
import Then

//MARK: - FirstMemberCollectionViewCell
final class FirstMemberCollectionViewCell: UICollectionViewCell {
    
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
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private let matchButton = UIButton().then {
        $0.setTitle("매칭하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10.0
    }
    
    //MARK: - Variables
    static let identifier = "FirstMemberCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

//MARK: - Extentions
extension FirstMemberCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .systemGray5
        contentView.adds([
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
            $0.width.equalTo(69)
            $0.height.equalTo(28)
        }
    }
    
    //MARK: - General Helpers
    func databind(name: String, gender: String, age: Int, profileImage: String, remaning: Int) {
        nameLabel.text = name
        infoLabel.text = gender; "\(age)"
        memberImageView.image = UIImage(named: profileImage)
        remainingLabel.text = "\(remaning)"
    }
    
}
    
