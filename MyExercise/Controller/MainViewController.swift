//
//  MainViewController.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

class MainViewController: BaseViewController {
    
    private let selfView = MainView()
    
    private var model = [ExRecordData]()
    
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
        let exMockData = ExRecordData(username: "이건준", exerciseType: .chest)
        let exMockData1 = ExRecordData(username: "신범철", exerciseType: .back)
        let exMockData2 = ExRecordData(username: "이상준", exerciseType: .arm)
        let exMockData3 = ExRecordData(username: "문진우", exerciseType: .leg)
        let exMockData4 = ExRecordData(username: "김규리", exerciseType: .shoulder)
        
        model.append(exMockData)
        model.append(exMockData1)
        model.append(exMockData2)
        model.append(exMockData3)
        model.append(exMockData4)
    }
}

//MARK: -UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExRecordCell.identifier, for: indexPath) as? ExRecordCell ?? ExRecordCell()
        print("indexPath = \(indexPath.row)")
        let mockData = model[indexPath.row]
        cell.configureCell(with: mockData)
        cell.delegate = self
        cell.exerciseChartView.exerciseChartTableView.dataSource = self
        cell.exerciseChartView.exerciseChartTableView.delegate = self
        return cell
    }
}

//MARK: -UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    //
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2, height: view.frame.height/2)
    }
}

extension MainViewController: ExRecordCellDelegate {
    func didTapLikeButton() {
        print("Tapped Like Button")
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: , for: <#T##IndexPath#>)
        return UITableViewCell()
    }
    
}

extension MainViewController: UITableViewDelegate {
    //
}
