//
//  TabBarViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/05/31.
//

import UIKit

import SnapKit
import Then

//MARK: - TabBarViewController

class TabBarViewController: UITabBarController {
    
    //MARK: - LazyComponents
    
    
    //MARK: - UIComponents
    
    
    //MARK: - Variables
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .blue
        
    }
}


//MARK: - Extentions



//MARK: - LayoutHelpers


//MARK: - GeneralHelpers


//MARK: - ActionHelpers


extension TabBarViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc1 = FriendViewController()
        let vc2 = ChatViewController()
        let vc3 = LibraryViewController()
        let vc4 = ShoppingViewController()
        let vc5 = PlusViewController()
  
    //각 TabBar에 ViewController 타이틀 설정

        vc1.title = ""
        vc2.title = ""
        vc3.title = ""
        vc4.title = ""
        vc5.title = ""


    //navigationController의 root view 설정
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.navigationBar.isHidden = true
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.navigationBar.isHidden = true
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.navigationBar.isHidden = true
        let nav4 = UINavigationController(rootViewController: vc4)
        nav4.navigationBar.isHidden = true
        let nav5 = UINavigationController(rootViewController: vc5)
        nav5.navigationBar.isHidden = true


        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
        let images = [
            "friendTabIcon",
            "messageTabIcon",
            "searchTabIcon",
            "shopTabIcon",
            "detailTabIcon"
        ]
        
        let imagesSelected = [
            "friendTabIcon_selected",
            "messageTabIcon_selected",
            "searchTabIcon_selected",
            "shopTabIcon_selected",
            "detailTabIcon_selected"
        ]
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: images[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imagesSelected[index])?.withRenderingMode(.alwaysOriginal)//원본해상도 유지를 위해
            tabBarItem.accessibilityIdentifier = images[index]//일단 없어도댐
        }
    }
}
