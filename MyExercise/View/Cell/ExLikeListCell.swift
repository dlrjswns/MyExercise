//
//  ExLikeListCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

class ExLikeListCell: UITableViewCell {
    
    static let identifier = "ExLikeListCell"
    
    private let dayExerciseLabel: UILabel = {
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayExerciseLabel.text = nil
       
    }
    
    //MARK: -Configure
    private func configureCell() {
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(dayExerciseLabel)
        dayExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        dayExerciseLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    }
    
    public func configureCell(with model: ExRecordData) {
        if let armExercises = model.dayExercise.armExercise {
            //Arm exercise
            _ = armExercises.map { armExercise in
                dayExerciseLabel.text = armExercise.rawValue
            }
            return
        }
        
        if let shoulderExercises = model.dayExercise.shoulderExercise {
            //Shoulder exercise
            _ = shoulderExercises.map { shoulderExercise in
                dayExerciseLabel.text = shoulderExercise.rawValue
            }
            return
        }
        
        if let backExercises = model.dayExercise.backExercise {
            //Back exercise
            _ = backExercises.map { backExercise in
                dayExerciseLabel.text = backExercise.rawValue
            }
            return
        }
        
        if let chestExercises = model.dayExercise.chestExercise {
            //Chest exercise
            _ = chestExercises.map { chestExercise in
                dayExerciseLabel.text = chestExercise.rawValue
            }
            return
        }
        
        if let legExercises = model.dayExercise.legExercise {
            //Leg exercise
            _ = legExercises.map { legExercise in
                dayExerciseLabel.text = legExercise.rawValue
            }
            return
        }
        
    }
}
