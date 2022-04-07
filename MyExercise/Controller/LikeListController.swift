//
//  LikeListController.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

class LikeListController: BaseViewController {
    
    private let selfView = LikeListView()
    
    private var likeModels = [ExRecordData]()
    
    //MARK: -Init
    init(likeModel: ExRecordData) {
        let exRecordData = likeModel
        self.likeModels.append(exRecordData)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let exerciseNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        selfView.tableView.register(ExLikeListCell.self, forCellReuseIdentifier: ExLikeListCell.identifier)
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self
    }
}

extension LikeListController: UITableViewDelegate {
    //
}

extension LikeListController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExLikeListCell.identifier, for: indexPath) as? ExLikeListCell ?? ExLikeListCell()
        
        return cell
    }
}
