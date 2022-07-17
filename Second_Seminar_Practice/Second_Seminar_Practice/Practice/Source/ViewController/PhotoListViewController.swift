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
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        return collectionView
    }()
    
    //MARK: - Variables
    
    let albumImageNames: [String] =
    [
        "musicAlbum1",
        "musicAlbum2",
        "musicAlbum3",
        "musicAlbum4"
        
    ]
    
    var selectedPhoto: [Int] = Array(repeating: 0, count: 21)//버튼이 눌린것을 저장
    
    var totalNumber: Int = 0
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        register()
        configDelegate()
        layout()
        
        print(selectedPhoto)
    }
}

//MARK: - Extensions

extension PhotoListViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.add(photoListCollectonView)
        
        let width = (UIScreen.main.bounds.width - 4)/3
        
        photoListCollectonView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
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
        let width = (UIScreen.main.bounds.width - 4)/3
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
            albumImage: albumImageNames[indexPath.item%4],
            number: selectedPhoto[indexPath.item]
        )
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedPhoto[indexPath.item] == 0 {
            totalNumber += 1
            selectedPhoto[indexPath.item] = totalNumber
        }
        else {
            totalNumber -= 1
            var selectedNumber = selectedPhoto[indexPath.item]
            
            for i in 0..<selectedPhoto.count {
                if selectedNumber < selectedPhoto[i] {
                    selectedPhoto[i] -= 1
                } else if selectedNumber == selectedPhoto[i] {
                    selectedPhoto[i] = 0
                }
            }
        }
        collectionView.reloadData()
    }
}
