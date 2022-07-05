//
//  AppListPracticeCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/24.
//

import UIKit

import SnapKit
import Then

//MARK: - AppListCollectionViewCell

final class AppListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    
    private let appImageContainerView = UIView().then{
        $0.backgroundColor = .clear
    }
    
    private let appImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = .systemGray6
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
        $0.backgroundColor = . systemGray
    }
    
    //MARK: - Variables
    
    static let identifier = "AppListCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}

//MARK: - Extentions
extension AppListCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.adds(
            [
                appImageContainerView,
                appImageView,
                titleLabel,
                descriptionLabel,
                downloadButton
            ]
        )
        
        appImageContainerView.add(appImageView)
        
        appImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.width.height.equalTo(80)
        }
        
        appImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.appImageContainerView)
            $0.leading.equalTo(self.appImageContainerView.snp.trailing).offset(19)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(self.titleLabel)
        }
        
        downloadButton.layer.cornerRadius = 12
        downloadButton.snp.makeConstraints {
            $0.bottom.equalTo(self.appImageContainerView)
            $0.leading.equalTo(self.titleLabel)
            $0.width.equalTo(65)
            $0.height.equalTo(25)
        }
    }
    
    //MARK: - General Helpers
    func databind(appImage: String, appTitle: String, appDescription:String) {
        appImageView.image = UIImage(named: appImage)
        titleLabel.text = appTitle
        descriptionLabel.text = appDescription
    }
    
    func changeBackground(isSelected: Bool) {
        if isSelected {
            backgroundColor = .white
            contentView.backgroundColor = .white
        }
        else {
            backgroundColor = .clear
            contentView.backgroundColor = .clear
        }
    }
}
