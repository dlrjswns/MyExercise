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
        tableView.backgroundColor = .systemBackground
//        tableView.clipsToBounds = true
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configureUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
