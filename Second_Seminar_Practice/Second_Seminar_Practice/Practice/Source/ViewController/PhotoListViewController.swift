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
    
    private lazy var photoListCollectonView: uicollectionview = {
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
    
    let albumImageNames: [String] = []
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configDelegate()
        layout()
    }
}

//MARK: - Extensions

extension PhotoListViewController {
      
    //MARK: - Layout Helpers
    
    private func layout() {
        view.add()
        
        let width = (UIScreen.main.bounds.width)/3
        
        
    }
    
    //MARK:  - General Helpers
    
    private func register() {
        
    }
    
    private func configDelegate() {
        photoListCollectonView.delegate = self
        photoListCollectonView.dataSource = self
    }
}

//MARK:  - UICollectionViewDelegateFlowLayout

extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        <#code#>
    }
}

//MARK: - UICollectionViewDataSource
extension PhotoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

        
    

    

