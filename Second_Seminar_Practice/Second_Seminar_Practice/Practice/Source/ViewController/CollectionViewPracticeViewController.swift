//
//  CollectionViewPracticeViewController.swift
//  Second_Seminar_Practice
//
//  Created by Joon Baek on 2022/06/11.
//

import UIKit

import SnapKit
import Then

final class CollectionPracticeViewController: UIViewController {
    
    // MARK: - Lazy Components
    
    private lazy var appTableView: UITableView = {
        let tableView = UITableView().then {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
        return tableView//**먼저**
    }()//잊지않기
    
    // MARK: - Variables
    
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
    
    var serviceList: [ServiceListDataModel] = []
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configDelegate()
        layout()
        inputDataInModel()
    }
}

// MARK: - Extensions

extension CollectionPracticeViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.add(appTableView)
        
        appTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(106 * 8 + 150)
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        appTableView.register(
            AppTableViewCell.self,
            forCellReuseIdentifier: AppTableViewCell.identifier
        )
    }
    
    private func configDelegate() {
        appTableView.delegate = self
        appTableView.dataSource = self
    }
    
    private func inputDataInModel() {
        for i in 0..<9 {
            self.serviceList.append(
                ServiceListDataModel(
                    iconImageName: self.serviceImageNames[i],
                    name: self.serviceNames[i],
                    description: self.serviceDescription[i]
                )
            )
        }//배열생성
        appTableView.reloadData()//안전을 위해
    }
}

// MARK: - UITableViewDelegate

extension CollectionPracticeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 150
        }
        else {
            return 106
        }
    }
}

// MARK: - UITableViewDataSource

extension CollectionPracticeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let appCell = tableView.dequeueReusableCell(
                withIdentifier: AppTableViewCell.identifier,
                for: indexPath
            ) as? AppTableViewCell else { return UITableViewCell() }
            appCell.dataBind(model: serviceList[indexPath.row])
            return appCell
        }
        else {
            guard let appCell = tableView.dequeueReusableCell(
                withIdentifier: AppTableViewCell.identifier,
                for: indexPath
            ) as? AppTableViewCell else { return UITableViewCell() }
            appCell.dataBind(model: serviceList[indexPath.row])
            return appCell
        }
    }
}
