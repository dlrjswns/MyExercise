//
//  ExChartView.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

class ExChartView: BaseView {
    
    let exerciseChartTableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        addSubview(exerciseChartTableView)
        exerciseChartTableView.translatesAutoresizingMaskIntoConstraints = false
        exerciseChartTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        exerciseChartTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        exerciseChartTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        exerciseChartTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
