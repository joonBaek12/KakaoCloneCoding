//
//  MemberPraciceViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/10.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

//MARK: - MemberPraciceViewController
final class MemberPracticeViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        return collectionView
    }()
    
    private lazy var memberCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        return collectionView
    }()
    //MARK: - UIComponents
    private let countMemberLabel = UILabel().then {
        $0.text = "매칭회원 회원 3명"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    //MARK: - Variables
    
    var isMatched: Bool = true 
    
    var matchedList: [Profile] = [
        Profile(
            name: "백희열",
            gender: "남",
            age: 27,
            profileImage: "imageProfile",
            remaining: 3,
            isMatched: true
        ),
        Profile(
            name: "강성준",
            gender: "남",
            age: 27,
            profileImage: "imageProfile",
            remaining: 5,
            isMatched: true
        ),
        Profile(
            name: "노한솔",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 2,
            isMatched: true
        ),
        Profile(
            name: "백준",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 10,
            isMatched: true
        ),
        Profile(
            name: "홍길동",
            gender: "남",
            age: 22,
            profileImage: "imageProfile",
            remaining: 3,
            isMatched: true
        ),
        Profile(
            name: "백희영",
            gender: "여",
            age: 24,
            profileImage: "imageProfile",
            remaining: 4,
            isMatched: true
        ),
        Profile(
            name: "길은지",
            gender: "남",
            age: 25,
            profileImage: "imageProfile",
            remaining: 8,
            isMatched: true
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 12,
            isMatched: true
        )
    ]
    
    var unmatchedList: [Profile] =  [
        Profile(
            name: "백희열",
            gender: "남",
            age: 27,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "강성준",
            gender: "남",
            age: 27,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "노한솔",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "백준",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "홍길동",
            gender: "남",
            age: 22,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "백희영",
            gender: "여",
            age: 24,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "길은지",
            gender: "남",
            age: 25,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 0,
            isMatched: false
        )
    ]
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = 0xF8F8F8.color
        register()
        config()
        configDelegate()
        layout()
        relayout()
    }
}

//MARK: - Extensions

extension MemberPracticeViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.adds(
            [
                tabCollectionView,
                countMemberLabel,
                memberCollectionView
            ]
        )
        
        let width = (UIScreen.main.bounds.width - 19*2)
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(50)
        }
        
        countMemberLabel.snp.makeConstraints {
            $0.top.equalTo(self.tabCollectionView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(20)
        }
        
        memberCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.countMemberLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
            $0.height.equalTo(0)
        }
    }
    
    private func relayout() {
        if isMatched {
            let count = CGFloat(matchedList.count)
            memberCollectionView.snp.remakeConstraints {
                $0.top.equalTo(self.countMemberLabel.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.lessThanOrEqualToSuperview()
                $0.height.equalTo(count * 75  + (count-1) * 16 + 40)
            }
        } else {
            let count = CGFloat(unmatchedList.count)
            memberCollectionView.snp.remakeConstraints {
                $0.top.equalTo(self.countMemberLabel.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.lessThanOrEqualToSuperview()
                $0.height.equalTo(count * 75  + (count-1) * 16 + 40)
            }
        }
    }
    
    //MARK: - General Helpers
    private func config() {
        countMemberLabel.text = "매칭 회원 \(matchedList.count)명"
    }
    
    private func register() {
        tabCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
        memberCollectionView.register(FirstMemberCollectionViewCell.self, forCellWithReuseIdentifier: FirstMemberCollectionViewCell.identifier)
        memberCollectionView.register(SecondMemberCollectionViewCell.self, forCellWithReuseIdentifier: SecondMemberCollectionViewCell.identifier)
    }
    
    private func configDelegate() {
        memberCollectionView.delegate = self
        memberCollectionView.dataSource = self
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
    }
}

    //MARK: - ActionHelpers
//    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
//        if gesture.state == .began {
//
//        } else if gesture.state == .changed {
//            let translation = gesture.translation(in: self.view)
//            imageView.transform = CGAffineTransform(translationX: translation.x, y: 0)
//        } else if gesture.state == .ended {
//
//        }
//}
    

//MARK: - UICollectionViewDelegateFlowLayout
extension MemberPracticeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabCollectionView {
            return CGSize(width: 80, height: 30)
        } else {
            let width = UIScreen.main.bounds.width - 40
            return CGSize(width: width, height: 75)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tabCollectionView {
            return 17
        } else {
            return 16
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tabCollectionView {
            return 17
        } else {
            return 16
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tabCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MemberPracticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tabCollectionView {
            return 2
        } else {
            if isMatched {
                return matchedList.count
            } else {
                return unmatchedList.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabCollectionView {
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath)
                    as? TabCollectionViewCell else {return UICollectionViewCell()}
            
            tabCell.databind(index: indexPath.item, isMatched: isMatched)
            return tabCell
        } else {
            if isMatched {
                guard let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstMemberCollectionViewCell.identifier, for: indexPath)
                        as? FirstMemberCollectionViewCell else {return UICollectionViewCell()}
                
                firstCell.databind(name: matchedList[indexPath.item].name,
                                   gender: matchedList[indexPath.item].gender,
                                   age: matchedList[indexPath.item].age,
                                   profileImage: matchedList[indexPath.item].profileImage,
                                   remaning: matchedList[indexPath.item].remaining)
                
                return firstCell
            } else {
                guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondMemberCollectionViewCell.identifier, for: indexPath)
                        as? SecondMemberCollectionViewCell else {return UICollectionViewCell()}
                secondCell.databind(model: unmatchedList[indexPath.item])
                
                return secondCell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCollectionView {
            if isMatched {
                if indexPath.item == 0 {
                    
                } else {
                    isMatched = false
                    countMemberLabel.text = "매칭이 종료된 회원 \(unmatchedList.count)명"
                }
            } else {
                if indexPath.item == 0 {
                    isMatched = true
                    countMemberLabel.text = "매칭 회원 \(matchedList.count)명"
                } else {
                    
                }
            }
            relayout()
            tabCollectionView.reloadData()
            memberCollectionView.reloadData()
        }
    }
}
