//
//  PhotoListCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/27.
//

import UIKit

import SnapKit
import Then

//MARK: - PhotoListCollectionViewCell

final class PhotoListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    
    private let albumImageContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let albumImageView = UIImageView()
    
    private let numberLabel = UILabel().then {
        $0.textColor = .blue
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    //MARK: - Variables
    
    static let identifier = "PhotoListCollectionViewCell"
    
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

//MARK:  - Extentions

extension PhotoListCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.adds(
            [
                albumImageContainerView,
                albumImageView,
                numberLabel
            ]
        )
        
        let width = (UIScreen.main.bounds.width)/3
        albumImageContainerView.adds([albumImageView,numberLabel])
        albumImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    //MARK: - General Helpers
    
    func databind(albumImage: String, number: Int ) {
        albumImageView.image = UIImage(named: albumImage)
        numberLabel.text = String(0)
    }
    
    func didSelectItem(selectedPhoto: Int){
//        var totalNumber: [Int] = []
            
        if (selectedPhoto == 0){
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = UIColor.orange.cgColor
            }
            else{
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = UIColor.blue.cgColor
            }
        
    }
    
    //    func changeBackground(isSelected: Bool) {
    //
    //        if isSelected {
    //
    //            contentView.layer.borderWidth = 1
    //            contentView.layer.borderColor = UIColor.orange.cgColor
    //        }
    //        else {
    //            contentView.layer.borderWidth = 1
    //            contentView.layer.borderColor = UIColor.blue.cgColor
    //        }//isHidden
    //    }
}

