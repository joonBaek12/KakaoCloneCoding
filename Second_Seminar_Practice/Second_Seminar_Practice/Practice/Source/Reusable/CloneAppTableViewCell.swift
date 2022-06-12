//
//  CloneAppTableViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/11.
//

import UIKit

import SnapKit
import Then

//MARK: - AppTableViewCell

final class CloneAppTableViewCell: UITableViewCell {

//MARK: - Lazy Components
    
    //MARK: - Components
    private let appImageContainerView = UIView().then {
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
    
    private let downlaodButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
        $0.backgroundColor = .systemGray
    }
    
    //MARK: - Variables
    
    static let identifier = "AppTableViewCell"
    
    //MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: .default,reuseIdentifier: CloneAppTableViewCell.identifier)
//        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: -Extentions
    extension CloneAppTableViewCell {
    //MARK: - Layout Helpers
    
    //MARK: - General Helpers

    func dataBind(model: ServiceListDataModel) {
        appImageView.image = UIImage(named: model.iconImageName)
        titleLabel.text = model.name
        descriptionLabel.text = model.description
    }
}
