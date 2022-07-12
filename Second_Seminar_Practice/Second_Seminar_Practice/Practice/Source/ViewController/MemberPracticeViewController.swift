//
//  MemberPraciceViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/10.
//

import UIKit

import SnapKit
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
    private let statusBarContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let matchedMemberLabel = UILabel().then {
        $0.text = "매칭회원"
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    private let expiredMemberLabel = UILabel().then {
        $0.text = "종료회원"
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    private let countMemberLabel = UILabel().then {
        $0.text = "매칭회원 회원 3명"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let searchButton = UIImageView().then {
        $0.image = UIImage(named: "zoom-in")
    }
    
    private let plusButton = UIImageView().then {
        $0.image = UIImage(named: "user-plus")
    }
    
    //MARK: - Variables
    
    // MARK: - Profile
    
    struct Profile {
        var name: String
        var gender: String
        var age: Int
        var profileImage: String
        var remaining: Int
        var isMatched: Bool
    }
    
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
            remaining: 3,
            isMatched: false
        ),
        Profile(
            name: "강성준",
            gender: "남",
            age: 27,
            profileImage: "imageProfile",
            remaining: 5,
            isMatched: false
        ),
        Profile(
            name: "노한솔",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 2,
            isMatched: false
        ),
        Profile(
            name: "백준",
            gender: "남",
            age: 28,
            profileImage: "imageProfile",
            remaining: 10,
            isMatched: false
        ),
        Profile(
            name: "홍길동",
            gender: "남",
            age: 22,
            profileImage: "imageProfile",
            remaining: 3,
            isMatched: false
        ),
        Profile(
            name: "백희영",
            gender: "여",
            age: 24,
            profileImage: "imageProfile",
            remaining: 4,
            isMatched: false
        ),
        Profile(
            name: "길은지",
            gender: "남",
            age: 25,
            profileImage: "imageProfile",
            remaining: 8,
            isMatched: false
        ),
        Profile(
            name: "진돗개",
            gender: "남",
            age: 31,
            profileImage: "imageProfile",
            remaining: 12,
            isMatched: false
        )
    ]
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configDelegate()
        layout()
    }
}

//MARK: - Extentions

extension MemberPracticeViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.adds(
            [
                statusBarContainerView,
                countMemberLabel,
                memberCollectionView
            ]
        )
        
        statusBarContainerView.adds(
            [
                matchedMemberLabel,
                expiredMemberLabel,
                searchButton,
                plusButton
            ]
        )
        
        let width = (UIScreen.main.bounds.width - 19*2)
        
        statusBarContainerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(69)
        }
        
        countMemberLabel.snp.makeConstraints {
            $0.top.equalTo(self.statusBarContainerView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(20)
        }
        
        memberCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.countMemberLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(0)

        }
    }
    
    //MARK: - General Helpers
    private func register() {
        memberCollectionView.register(FirstMemberCollectionViewCell.self, forCellWithReuseIdentifier: FirstMemberCollectionViewCell.identifier)
    }
    
    private func configDelegate() {
        memberCollectionView.delegate = self
        memberCollectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MemberPracticeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 19*2)
        return CGSize(width: width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
// MARK: - UICollectionViewDataSource
extension MemberPracticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let memberCell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstMemberCollectionViewCell.identifier, for: indexPath)
                as? FirstMemberCollectionViewCell else {return UICollectionViewCell()}
        
        memberCell.databind(name: matchedList[indexPath.item].name,
                            gender: matchedList[indexPath.item].gender,
                            age: matchedList[indexPath.item].age,
                            profileImage: matchedList[indexPath.item].profileImage,
                            remaning: matchedList[indexPath.item].remaining)
        
        return memberCell
    }
    
}
