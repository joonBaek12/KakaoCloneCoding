//
//  MyPageViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/07/20.
//

import UIKit

import SnapKit
import Then

//MARK: - MyPageViewController
class MyPageViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    //MARK: - UIComponents
    
    //MARK: - Variables
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

    }

}

//MARK: - Extensions
extension MyPageViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        
    }
    //MARK: - General Helpers
    
    //MARK: - ActionHelpers
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    
    
}
//MARK: - UICollectionViewDataSource
extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
