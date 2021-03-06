//
//  MainViewController.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

protocol MainVCSendDataDelegate: AnyObject {
    func sendLikedData(with model: ExRecordData)
}

class HomeViewController: BaseViewController {
    
    private let selfView = MainView()
    
    private var exRecordModels = [ExRecordData]()
    
    private var exChartModels = [ExChartData]()
    
    private var likedModels = [ExRecordData]()
    
    weak var delegate: MainVCSendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMockData()
    }
    
    //MARK: -Configure
    override func configureUI() {
        view.backgroundColor = .systemBackground
        ///AutoLayout
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        ///UI Attribute
        selfView.collectionView.register(ExRecordCell.self, forCellWithReuseIdentifier: ExRecordCell.identifier)
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
        
        
    }
    
    func createMockData() {
        let exMockData = ExRecordData(username: "이건준",
                                      exerciseType: .chest,
                                      exerciseDate: Date().fetchDateToString(),
                                      dayExercise: DayExercise(chestExercise: [ChestExercise.chestBBPress], backExercise: nil, legExercise: nil, shoulderExercise: nil, armExercise: [ArmExercise.oneArmBBCurl, ArmExercise.cablePushDown]))
        let exMockData1 = ExRecordData(username: "신범철",
                                       exerciseType: .back,
                                       exerciseDate: Date().fetchDateToString(),
                                       dayExercise: DayExercise(chestExercise: [ChestExercise.chestBBPress], backExercise: [BackExercise.BBRow], legExercise: nil, shoulderExercise: nil, armExercise: [ArmExercise.oneArmBBCurl, ArmExercise.cablePushDown]))
        let exMockData2 = ExRecordData(username: "이상준",
                                       exerciseType: .arm,
                                       exerciseDate: Date().fetchDateToString(),
                                       dayExercise: DayExercise(chestExercise: [ChestExercise.chestBBPress], backExercise: nil, legExercise: nil, shoulderExercise: nil, armExercise: [ArmExercise.oneArmBBCurl, ArmExercise.cablePushDown]))
        let exMockData3 = ExRecordData(username: "문진우",
                                       exerciseType: .leg,
                                       exerciseDate: Date().fetchDateToString(),
                                       dayExercise: DayExercise(chestExercise: [ChestExercise.chestBBPress], backExercise: nil, legExercise: nil, shoulderExercise: nil, armExercise: [ArmExercise.oneArmBBCurl, ArmExercise.cablePushDown]))
        let exMockData4 = ExRecordData(username: "김규리",
                                       exerciseType: .shoulder,
                                       exerciseDate: Date().fetchDateToString(),
                                       dayExercise: DayExercise(chestExercise: [ChestExercise.chestBBPress], backExercise: nil, legExercise: nil, shoulderExercise: nil, armExercise: [ArmExercise.oneArmBBCurl, ArmExercise.cablePushDown]))
        
        exRecordModels.append(exMockData)
        exRecordModels.append(exMockData1)
        exRecordModels.append(exMockData2)
        exRecordModels.append(exMockData3)
        exRecordModels.append(exMockData4)
        
        exChartModels.append(ExChartData(
            exerciseName: "",
            exerciseType: DayExercise(chestExercise: [ChestExercise.chestBBPress],
                                      backExercise: [BackExercise.BBRow, BackExercise.deadLift],
                                      legExercise: nil,
                                      shoulderExercise: nil,
                                      armExercise: nil)))
        exChartModels.append(ExChartData(
            exerciseName: "",
                                exerciseType: DayExercise(chestExercise: [ChestExercise.chestBBPress, ChestExercise.flyChest],
                                      backExercise: [BackExercise.BBRow, BackExercise.deadLift],
                                      legExercise: nil,
                                      shoulderExercise: [ShoulderExercise.frontRaise],
                                      armExercise: nil)))
        exChartModels.append(ExChartData(
            exerciseName: "",
            exerciseType: DayExercise(chestExercise: [ChestExercise.chestBBPress],
                                      backExercise: [BackExercise.BBRow, BackExercise.deadLift],
                                      legExercise: nil,
                                      shoulderExercise: nil,
                                      armExercise: nil)))
        exChartModels.append(ExChartData(
            exerciseName: "",
            exerciseType: DayExercise(chestExercise: [ChestExercise.chestBBPress],
                                      backExercise: [BackExercise.BBRow, BackExercise.deadLift],
                                      legExercise: nil,
                                      shoulderExercise: nil,
                                      armExercise: nil)))
        exChartModels.append(ExChartData(
            exerciseName: "",
            exerciseType: DayExercise(chestExercise: [ChestExercise.chestBBPress],
                                      backExercise: [BackExercise.BBRow, BackExercise.deadLift],
                                      legExercise: nil,
                                      shoulderExercise: nil,
                                      armExercise: nil)))
    }
}

//MARK: -UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exRecordModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExRecordCell.identifier, for: indexPath) as? ExRecordCell ?? ExRecordCell()
        print("indexPath = \(indexPath.row)")
        let mockData = exRecordModels[indexPath.row]
        cell.configureCell(with: mockData)
        cell.delegate = self
        cell.exerciseChartView.exerciseChartTableView.dataSource = self
        cell.exerciseChartView.exerciseChartTableView.delegate = self
        return cell
    }
}

//MARK: -UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2, height: view.frame.height/2)
    }
}

extension HomeViewController: ExRecordCellDelegate {
    func didTapLikeButton(with model: ExRecordData) {
        print("model = \(model)")
        likedModels.append(model)
        let vc = LikeListController(likeModels: likedModels)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exChartModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExChartCell.identifier, for: indexPath) as? ExChartCell ?? ExChartCell()
        let exchartData = exChartModels[indexPath.row]
        cell.configureCell(with: exchartData)
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
