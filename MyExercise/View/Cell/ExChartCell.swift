//
//  ExChartCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

class ExChartCell: UITableViewCell {
    
    static let identifier = "ExChartCell"
    
    private let exerciseNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(exerciseNameLabel)
        exerciseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        exerciseNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        exerciseNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        exerciseNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
