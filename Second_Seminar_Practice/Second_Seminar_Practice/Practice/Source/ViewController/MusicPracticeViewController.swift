//
//  MusicPracticeViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/19.
//

import UIKit

import SnapKit
import Then

//MARK: - MusicPracticeViewController

final class MusicPracticeViewController: UIViewController {
    
    //MARK: - Lazy Components
        
    private lazy var musicCollectionView: UICollectionView = {
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
    
    //MARK: - Components
        
    //MARK: - Variables
        
    let musicCoverNames: [String] = ["musicAlbum1", "musicAlbum2","musicAlbum3","musicAlbum4"]
    let musicTitleNames: [String] = ["가습기","Thick and Thin","시공간","NISEKOI"]
    let musicSingerNames: [String] = ["한요한","LANY","기리보이","Futuristic Swaver"]
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()

    }
}

//MARK: - Extentions

extension MusicPracticeViewController {

    //MARK: - Layout Helpers
    
    private func layout() {
        view.add(musicCollectionView)
        
        musicCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    //MARK: - General Helpers
    
    private func register() {
        musicCollectionView.register(
            MusicPracticeCollectionViewCell.self, forCellWithReuseIdentifier: MusicPracticeCollectionViewCell.identifier
        )
    }
    
    private func configDelegate() {
        musicCollectionView.delegate = self
        musicCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MusicPracticeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        width = (UIScreen.main.bounds.width - 9*2 - 3) / 2
        
        return (width: width, height: width + 34)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 28, left: 9, bottom: 28, right:9 )
    }
}

    // MARK: - UICollectionViewDataSource

extension MusicPracticeViewController: UICollectionViewDataSource {
    

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    8
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let musicCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: MusicPracticeCollectionViewCell.identifier, for: indexPath)
            as? MusicPracticeCollectionViewCell else {return UICollectionViewCell()}
    }
    musicCell.dataBind (
        albumImage: musicCoverNames[indexPath.item%4],
        musicTitle: musicTitleNames[IndexPath.item%4],
        singer: musicSingerNames[IndexPath.item%4]
    )
    return musicCell
    }

}

