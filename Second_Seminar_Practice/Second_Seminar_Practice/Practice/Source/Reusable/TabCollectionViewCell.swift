//
//  TabCollectionViewCell.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/17.
//

import UIKit
import SnapKit
import Then

//MARK: - TabCollectionViewCell
final class TabCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Components
    
    private let matchedMemberLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .bold)//암거나?
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    //MARK: - Variables
    static let identifier = "TabCollectionViewCell"
    
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
extension TabCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        backgroundColor = .clear
        contentView.adds(
            [
                matchedMemberLabel,
                underLineView
            ]
        )
        
        matchedMemberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    //MARK: - General Helpers
    func databind(index: Int, isMatched: Bool) {
        if isMatched {
            if index == 0 {
                matchedMemberLabel.text = "매칭회원"
                matchedMemberLabel.textColor = .black
                matchedMemberLabel.font = .systemFont(ofSize: 22, weight: .bold)
                underLineView.backgroundColor = .cyan
                
            } else {
                matchedMemberLabel.text = "종료회원"
                matchedMemberLabel.textColor = .gray
                matchedMemberLabel.font = .systemFont(ofSize: 22, weight: .regular)
                underLineView.backgroundColor = .clear
            }
        } else {
            if index == 0 {
                matchedMemberLabel.text = "매칭회원"
                matchedMemberLabel.textColor = .gray
                matchedMemberLabel.font = .systemFont(ofSize: 22, weight: .regular)
                underLineView.backgroundColor = .clear
            } else {
                matchedMemberLabel.text = "종료회원"
                matchedMemberLabel.textColor = .black
                matchedMemberLabel.font = .systemFont(ofSize: 22, weight: .bold)
                underLineView.backgroundColor = .cyan
            }
        }
    }
}
