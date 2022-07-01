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
    
    private let albumImageView = UIImageView()
    
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
}

//MARK:  - Extentions

extension PhotoListCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .systemBlue
        contentView.add(albumImageView)
        
        let width = (UIScreen.main.bounds.width/3)
        
    }
    
    //MARK: - General Helpers
    
    func databind(albumImage:String) {
        albumImageView.image = UIImage(named: albumImage)
    }
    
    func changeBackground(isSelected: Bool) {
        if isSelected{
            backgroundColor = .orange
            contentView.backgroundColor = .red
        }
        else {
            backgroundColor = .clear
            contentView.backgroundColor = .clear
        }
    }
}
