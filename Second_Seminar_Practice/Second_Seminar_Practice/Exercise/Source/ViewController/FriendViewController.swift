//
//  FriendViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/15.
//

import UIKit

import SnapKit
import Then

//MARK: - FriendViewController

final class FriendViewController: UIViewController {
    
    //MARK: - LazyComponents
    
    private lazy var appTableView: UITableView = {
        let tableView = UITableView().then {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
        return tableView
    }()
    
    //MARK: - UIComponents
    
    //MARK: - Variables
    let profileImageNames: [String] =
    [
        "friendtab_profileImg",
        "강성준",
        "노한솔",
        "백희열",
        "동산교회",
        "아빠",
        "엄마",
        "동생",
        "할아버지",
        "할머니",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구"
    ]
    
    let profileNames: [String] =
    [
        "백준",
        "강성준",
        "노한솔",
        "백희열",
        "동산교회",
        "아빠",
        "엄마",
        "동생",
        "할아버지",
        "할머니",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구",
        "친구"
    ]
    
    let descriptionMessagges: [String] =
    [
        "우리 고양이의 까다로운 입맛 정리 서비스",
        "MZ세대를 위한, 올인원 대학생활 관리 플랫폼",
        "책 속의 문장과 함께 쓰는 일기",
        "나에게 돌아오는 맞춤 날씨 서비스",
        "나를 알아가는 질문 다이어리",
        "우리들끼리 공유하는 최애장소, 플레이스픽",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리 고양이의 까다로운 입맛 정리 서비스",
        "MZ세대를 위한, 올인원 대학생활 관리 플랫폼",
        "책 속의 문장과 함께 쓰는 일기",
        "나에게 돌아오는 맞춤 날씨 서비스",
        "나를 알아가는 질문 다이어리",
        "우리들끼리 공유하는 최애장소, 플레이스픽",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글",
        "우리가 만드는 문장 큐레이션 플랫폼, 몽글"
    ]
    
    var friendList: [ProfileDataModel] = []
    
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        register()
        configDelegate()
        layout()
        inputDataModel()
        
    }
    
    
    
}


//MARK: - Extentions

extension FriendViewController {
    
    //MARK: - LayoutHelpers
    
    private func layout() {
        view.add(appTableView)
        
        appTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(50 * 19 + 73)
        }
    }
    
    //MARK: - GeneralHelpers
    
    private func register() {
        appTableView.register(
            FriendTableViewCell.self,
            forCellReuseIdentifier: FriendTableViewCell.identifier
        )
        
        appTableView.register(
            BigFriendTableViewCell.self,
            forCellReuseIdentifier: BigFriendTableViewCell.identifier
        )
    }
    
    private func configDelegate() {
        appTableView.delegate = self
        appTableView.dataSource = self
    }
    
    private func inputDataModel() {
        for i in 0..<20 {
            self.friendList.append(
                ProfileDataModel(
                    profileImageName: self.profileImageNames[i],
                    name:  self.profileNames[i],
                    description: self.descriptionMessagges[i]
                )
            )
        }
        appTableView.reloadData()
    }
}
    
    //MARK: - ActionHelpers
    
//    private func addGesture() {
//        let gesture = UITapGestureRecognizer()
//        gesture.addTarget(self, action: #selector(touchupProfileButton))
//        profileMainImageView.addGestureRecognizer(gesture)
//    }
//
//    //    self.navigationController?.navigationBar.isHidden = true
//
//
//    @objc
//    private func touchupProfileButton() {
//        let myTabVC = MyTabViewController()
//        myTabVC.modalPresentationStyle = .overFullScreen
//        self.present(myTabVC, animated:  true, completion: nil)
//    }
//
//}

    //MARK: - UItableViewDelegate
extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 73
        }
        else {
            return 50
        }
    }
}
    //MARK: - UITableViewDataSource
extension FriendViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let friendCell = tableView.dequeueReusableCell(
                withIdentifier: BigFriendTableViewCell.identifier,
                for: indexPath
            ) as? BigFriendTableViewCell else { return UITableViewCell()}
            friendCell.dataBind(model: friendList[indexPath.row])
            return friendCell
        }
        else {
            guard let friendCell = tableView.dequeueReusableCell(
                withIdentifier: FriendTableViewCell.identifier,
                for: indexPath
            ) as? FriendTableViewCell else { return UITableViewCell() }
            friendCell.dataBind(model: friendList [indexPath.row])
            return friendCell
        }
    }
}
    

