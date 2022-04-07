//
//  LikeListView.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

class LikeListView: BaseView {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
