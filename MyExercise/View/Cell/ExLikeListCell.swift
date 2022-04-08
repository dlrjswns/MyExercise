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
        label.text = "dfdf"
        return label
    }()
    
    private let dayExerciseLabel1: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "dfdf"
        return label
    }()
    
    private let dayExerciseLabel2: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "dfdf"
        return label
    }()
    
    private let dayExerciseLabel3: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "dfdf"
        return label
    }()
    
    private let dayExerciseLabel4: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "dfdf"
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("contentViewFrame = \(contentView.frame.height/6)")
        dayExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        dayExerciseLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        dayExerciseLabel1.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel1.topAnchor.constraint(equalTo: dayExerciseLabel.bottomAnchor, constant: 30).isActive = true
        dayExerciseLabel1.leftAnchor.constraint(equalTo: dayExerciseLabel.leftAnchor).isActive = true
        
        dayExerciseLabel2.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel2.topAnchor.constraint(equalTo: dayExerciseLabel1.bottomAnchor, constant: 30).isActive = true
        dayExerciseLabel2.leftAnchor.constraint(equalTo: dayExerciseLabel1.leftAnchor).isActive = true
        
        dayExerciseLabel3.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel3.topAnchor.constraint(equalTo: dayExerciseLabel2.bottomAnchor, constant: 30).isActive = true
        dayExerciseLabel3.leftAnchor.constraint(equalTo: dayExerciseLabel2.leftAnchor).isActive = true
        
        dayExerciseLabel4.translatesAutoresizingMaskIntoConstraints = false
        dayExerciseLabel4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        dayExerciseLabel4.leftAnchor.constraint(equalTo: dayExerciseLabel3.leftAnchor).isActive = true
//        dayExerciseLabel4.topAnchor.constraint(equalTo: dayExerciseLabel3.bottomAnchor, constant: contentView.frame.height/6).isActive = true
        
    }
    
    //MARK: -Configure
    private func configureCell() {
        self.accessoryType = .disclosureIndicator
//        print("contentViewFrame = \(contentView.frame)")
        contentView.addSubview(dayExerciseLabel)
        
        
        contentView.addSubview(dayExerciseLabel1)
       
        
        contentView.addSubview(dayExerciseLabel2)
       
        
        contentView.addSubview(dayExerciseLabel3)
    
        
        contentView.addSubview(dayExerciseLabel4)
        
        
    }
    
    public func configureCell(with model: DayExercise) { // 일단 model은 잘 들어옴
        print("mmmm = \(model)")
        if let armExercises = model.armExercise {
            //Arm exercise
            _ = armExercises.map { armExercise in
                dayExerciseLabel.text = armExercise.rawValue
            }
            return
        }
        
        if let shoulderExercises = model.shoulderExercise {
            //Shoulder exercise
            _ = shoulderExercises.map { shoulderExercise in
                dayExerciseLabel.text = shoulderExercise.rawValue
            }
            return
        }
        
        if let backExercises = model.backExercise {
            //Back exercise
            _ = backExercises.map { backExercise in
                dayExerciseLabel.text = backExercise.rawValue
            }
            return
        }
        
        if let chestExercises = model.chestExercise {
            //Chest exercise
            _ = chestExercises.map { chestExercise in
                dayExerciseLabel.text = chestExercise.rawValue
            }
            return
        }
        
        if let legExercises = model.legExercise {
            //Leg exercise
            _ = legExercises.map { legExercise in
                dayExerciseLabel.text = legExercise.rawValue
            }
            return
        }
        
    }
}
