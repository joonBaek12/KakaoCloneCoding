//
//  PhotoListViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/27.
//

import UIKit

import SnapKit
import Then

//MARK: - PhotoListViewcontroller

final class PhotoListViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var photoListCollectonView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        let collectionView = UICollectionView(frame:  .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        return collectionView
    }()
    
    //MARK: - Variables
    
    let albumImageNames: [String] =
    [
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1",
        "musicAlbum1"

    ]
    
    var selectedIndex: [Bool] = Array(repeating: false, count: 21)
        
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        register()
        configDelegate()
        layout()
    }
}

//MARK: - Extensions

extension PhotoListViewController {
      
    //MARK: - Layout Helpers
    
    private func layout() {
        view.add(photoListCollectonView)
        
        let width = (UIScreen.main.bounds.width)/3
        
        photoListCollectonView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0)

        }
        
        
    }
    
    //MARK:  - General Helpers
    
    private func register() {
        photoListCollectonView.register(
            PhotoListCollectionViewCell.self, forCellWithReuseIdentifier: PhotoListCollectionViewCell.identifier
        )
    }
    
    private func configDelegate() {
        photoListCollectonView.delegate = self
        photoListCollectonView.dataSource = self
    }
}

//MARK:  - UICollectionViewDelegateFlowLayout

extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width-4)/3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

//MARK: - UICollectionViewDataSource

extension PhotoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoListCollectionViewCell.identifier, for: indexPath)
                as? PhotoListCollectionViewCell else {return UICollectionViewCell()}
        
        photoCell.databind(
            albumImage: albumImageNames[indexPath.item%3]
        )
        
        photoCell.changeBackground(isSelected: selectedIndex[indexPath.item])
        
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex[indexPath.item].toggle()
        collectionView.reloadData()
    }
}

        
    

    

