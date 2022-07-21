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
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        return collectionview
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
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
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "Ellipse 402")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "김카핀"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private let profileTabImage = UIImageView().then {
        $0.image = UIImage(named: "Rectangle 1354")
    }
    
    
    //MARK: - Variables
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        config()
        layout()
        
    }

}

//MARK: - Extensions
extension MyPageViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        
    }
    //MARK: - General Helpers
    private func config() {
        
    }
    
    private func register() {
        
    }
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
