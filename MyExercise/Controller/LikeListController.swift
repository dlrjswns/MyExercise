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
        print("likeModels = \(likeModels)")
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
        let likedDayExercises = likeModels.map { exRecordData in
            return exRecordData.dayExercise
        }
        let likedDayExercise = likedDayExercises[section]//likeModels가 가지고있는 dayExercise가 배열이 아니라 구조체임
        print("likedModel = \(likedDayExercise)")
        print("count = \(countUseableExercise(likedDayExercise: likedDayExercise))")
        return countUseableExercise(likedDayExercise: likedDayExercise)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExLikeListCell.identifier, for: indexPath) as? ExLikeListCell ?? ExLikeListCell()
        print("indexPath = \(indexPath.row)")
        let likedDayExercises = likeModels.map { exRecordData in
            return exRecordData.dayExercise
        }
        let likedDayExercise = likedDayExercises[indexPath.section] // DayExercise
        
        cell.configureCell(with: likedDayExercise)
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
    
    private func countUseableExercise(likedDayExercise: DayExercise) -> Int { //DayExercise중 데이터가 존재하는 운동만 count
        var count = 0
        if let chestExercises = likedDayExercise.chestExercise {
            print("chest")
            count += chestExercises.count
        }
        if let backExercises = likedDayExercise.backExercise {
            print("back")
            count += backExercises.count
        }
        if let shoulderExercises = likedDayExercise.shoulderExercise {
            print("shoulder")
            count += shoulderExercises.count
        }
        if let armExercises = likedDayExercise.armExercise {
            print("arm")
            count += armExercises.count
        }
        if let legExercises = likedDayExercise.legExercise {
            print("leg")
            count += legExercises.count
        }
        
            return count
//        let dayExerciseCount = likedDayExercise.map { dayExercise -> Int in
//            if let chestExercises = dayExercise.chestExercise {
//                return chestExercises.count
//            }
//            else if let backExercises = dayExercise.backExercise {
//                return backExercises.count
//            }
//            else if let shoulderExercises = dayExercise.shoulderExercise {
//                return shoulderExercises.count
//            }
//            else if let armExercises = dayExercise.armExercise {
//                return armExercises.count
//            }
//            else if let legExercises = dayExercise.legExercise {
//                return legExercises.count
//            }
//            return 0
//        }
//        return dayExerciseCount
    }
}
