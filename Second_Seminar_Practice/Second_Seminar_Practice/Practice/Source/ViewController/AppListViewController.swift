//
//  AppListPracticeViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/24.
//

import UIKit

import SnapKit
import Then

//MARK: - AppListViewController

final class AppListViewController: UIViewController {
    
    //MARK: - Lazy Components
        
    private lazy var appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        return collectionView
    }()
        
    //MARK: - Variables
        
    let serviceImageNames: [String] =
    [
        "soptAppIcon1",
        "soptAppIcon2",
        "soptAppIcon3",
        "soptAppIcon4",
        "soptAppIcon5",
        "soptAppIcon6",
        "soptAppIcon7",
        "soptAppIcon7",
        "soptAppIcon7"
    ]
    
    let serviceNames: [String] =
    [
        "OUNCE - 집사를 위한 똑똑한 기록장",
        "포켓유니브",
        "MOMO",
        "Weathy(웨디)",
        "BeMe",
        "placepic",
        "몽글(Mongle)",
        "몽글(Mongle)",
        "몽글(Mongle)"
    ]
    
    let serviceDescription: [String] =
    [
        "우리 고양이의 까다로운 입맛 정리 서비스",
        "MZ세대를 위한, 올인원 대학생활 관리 플랫폼",
        "책 속의 문장과 함께 쓰는 일기",
        "나에게 돌아오는 맞춤 날씨 서비스",
        "나를 알아가는 질문 다이어리",
        "우리들끼리 공유하는 최애장소, 플레이스픽",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글"
    ]
    
    var selectedList: [Bool] = Array(repeating: false, count: 9)
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configDelegate()
        layout()
    }
}

//MARK: - Extentions

extension AppListViewController {

    //MARK: - Layout Helpers
    
    private func layout() {
        view.add(appCollectionView)
        
        let width = (UIScreen.main.bounds.width - 9*2 - 3)
        
        appCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        appCollectionView.register(
            AppListCollectionViewCell.self, forCellWithReuseIdentifier: AppListCollectionViewCell.identifier
        )
    }
    
    private func configDelegate() {
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
    }
}
    
// MARK: - UICollectionViewDelegateFlowLayout

extension AppListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)
        return CGSize(width: 375, height: 106)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

    // MARK: - UICollectionViewDataSource

extension AppListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let appCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppListCollectionViewCell.identifier, for: indexPath)
                as? AppListCollectionViewCell else {return UICollectionViewCell()}
        
        appCell.databind(appImage: serviceImageNames[indexPath.item], appTitle: serviceNames[indexPath.item], appDescription: serviceDescription[indexPath.item]
        )
        
        appCell.changeBackground(isSelected: selectedList[indexPath.item])
        
        
        return appCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedList[indexPath.item].toggle()
        collectionView.reloadData()   
    }
}



