//
//  LikeListController.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

class LikeListController: BaseViewController {
    
    private let selfView = LikeListView()
    
    private let likeModels: [ExRecordData]
    
    //MARK: -Init
    init(likeModels: [ExRecordData]) {
        self.likeModels = likeModels
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.tableView.register(ExLikeListCell.self, forCellReuseIdentifier: ExLikeListCell.identifier)
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self
    }
}

extension LikeListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension LikeListController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return likeModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let likedDayExercise = likeModels.map { exRecordData in
            return exRecordData.dayExercise
        }
        countUseableExercise(likedDayExercise: likedDayExercise) //likeModels가 가지고있는 dayExercise가 배열이 아니라 구조체임
        return likedDayExercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExLikeListCell.identifier, for: indexPath) as? ExLikeListCell ?? ExLikeListCell()
        let exRecordData = likeModels[indexPath.row]
        cell.configureCell(with: exRecordData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let likedExerciseDays = likeModels.map { exRecordData in
            return exRecordData.exerciseDate
        }
        
        let likedUserName = likeModels.map { exRecordData in
            return exRecordData.username
        }
        
        return likedExerciseDays[section] + " \(likedUserName[section])"
    }
    
    private func countUseableExercise(likedDayExercise: [DayExercise]) {
        for x in 0..<likedDayExercise.count {
            
        }
    }
}
