//
//  MusicPracticeCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/19.
//

import UIKit

import SnapKit
import Then

//MARK: - MusicPracticeCollectionViewCell

final class MusicPracticeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    
    private let albumImageContainerView = UIView().then{
        $0.backgroundColor = .clear
    }
    
    private let albumImageView = UIImageView()
    private let musicTitleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let singerLabel = UILabel().then {
        $0.textColor = .systemGray2
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    
    //MARK: - Variables
    
    static let identifier = "MusicPracticeCollectionViewCell"
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }//자동생성(에러메시지 송출)
}

//MARK: - Extentions
extension MusicPracticeCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.adds(
            [
                albumImageContainerView,
                musicTitleLabel,
                singerLabel
                ]
            )
        
        let width = (UIScreen.main.bounds.width - 3 - 9*2)/2 - 6*2
        albumImageContainerView.add(albumImageView)
        albumImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(width)
        }
        
        albumImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        musicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.albumImageContainerView.snp.bottom).offset(4)
            $0.leading.equalTo(self.albumImageContainerView)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(self.musicTitleLabel.snp.bottom).offset(3)
            $0.leading.equalTo(self.albumImageContainerView)
        }
    }
    //MARK: - General Helpers
    
    func databind(albumImage: String, musicTitle: String, singer: String) {
        albumImageView.image = UIImage(named: albumImage)
        musicTitleLabel.text = musicTitle
        singerLabel.text = singer
    }
    
    func changeDataBind(albumImage: String) {
        albumImageView.image = UIImage(named: albumImage)
    }
}


