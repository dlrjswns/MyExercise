//
//  ExLikeListCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

struct Comment {
    static let chestComment = "계획된 가슴운동이 없습니다"
    static let backComment = "계획된 등운동이 없습니다"
    static let shoulderComment = "계획된 어깨운동이 없습니다"
    static let legComment = "계획된 다리운동이 없습니다"
    static let armComment = "계획된 팔운동이 없습니다"
}

class ExerciseLabel: UILabel {
    
    init(comment: String) {
        super.init(frame: .zero)
        configureUI()
        text = comment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        textColor = .label
        font = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
}

class ExLikeListCell: UITableViewCell {
    
    static let identifier = "ExLikeListCell"
    
//    private let chestExerciseLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = .label
//        label.text = Comment.chestComment
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
    private let chestExerciseLabel = ExerciseLabel(comment: Comment.chestComment)
    private let backExerciseLabel = ExerciseLabel(comment: Comment.backComment)
    private let shoulderExerciseLabel = ExerciseLabel(comment: Comment.shoulderComment)
    private let legExerciseLabel = ExerciseLabel(comment: Comment.legComment)
    private let armExerciseLabel = ExerciseLabel(comment: Comment.armComment)
    
//    private let backExerciseLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = .label
//        label.text = Comment.backComment
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
    
//    private let shoulderExerciseLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = .label
//        label.text = Comment.shoulderComment
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
    
//    private let legExerciseLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = .label
//        label.text = Comment.legComment
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
//
//    private let armExerciseLabel: UILabel = {
//       let label = UILabel()
//        label.textColor = .label
//        label.text = Comment.armComment
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        chestExerciseLabel.text = nil
        backExerciseLabel.text = nil
        shoulderExerciseLabel.text = nil
        legExerciseLabel.text = nil
        armExerciseLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("contentViewFrame = \(contentView.frame.height/6)")
        chestExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        chestExerciseLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        chestExerciseLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        backExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        backExerciseLabel.topAnchor.constraint(equalTo: chestExerciseLabel.bottomAnchor, constant: 10).isActive = true
        backExerciseLabel.leftAnchor.constraint(equalTo: chestExerciseLabel.leftAnchor).isActive = true
        
        shoulderExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        shoulderExerciseLabel.topAnchor.constraint(equalTo: backExerciseLabel.bottomAnchor, constant: 10).isActive = true
        shoulderExerciseLabel.leftAnchor.constraint(equalTo: backExerciseLabel.leftAnchor).isActive = true
        
        legExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        legExerciseLabel.topAnchor.constraint(equalTo: shoulderExerciseLabel.bottomAnchor, constant: 10).isActive = true
        legExerciseLabel.leftAnchor.constraint(equalTo: shoulderExerciseLabel.leftAnchor).isActive = true
        
        armExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
//        dayExerciseLabel4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        armExerciseLabel.topAnchor.constraint(equalTo: legExerciseLabel.bottomAnchor, constant: 10).isActive = true
        armExerciseLabel.leftAnchor.constraint(equalTo: legExerciseLabel.leftAnchor).isActive = true
//        dayExerciseLabel4.topAnchor.constraint(equalTo: dayExerciseLabel3.bottomAnchor, constant: -30).isActive = true
        
    }
    
    //MARK: -Configure
    private func configureCell() {
        self.accessoryType = .disclosureIndicator
//        print("contentViewFrame = \(contentView.frame)")
        contentView.addSubview(chestExerciseLabel)
        
        
        contentView.addSubview(backExerciseLabel)
       
        
        contentView.addSubview(shoulderExerciseLabel)
       
        
        contentView.addSubview(legExerciseLabel)
    
        
        contentView.addSubview(armExerciseLabel)
        
        
    }
    
    public func configureCell(with model: DayExercise) { // 일단 model은 잘 들어옴
        if let armExercises = model.armExercise {
            //Arm exercise
            _ = armExercises.map { armExercise in
                chestExerciseLabel.text = armExercise.rawValue
            }
        }
        
        if let shoulderExercises = model.shoulderExercise {
            //Shoulder exercise
            _ = shoulderExercises.map { shoulderExercise in
                backExerciseLabel.text = shoulderExercise.rawValue
            }
        }
        
        if let backExercises = model.backExercise {
            //Back exercise
            _ = backExercises.map { backExercise in
                shoulderExerciseLabel.text = backExercise.rawValue
            }
        }
        
        if let chestExercises = model.chestExercise {
            //Chest exercise
            _ = chestExercises.map { chestExercise in
                legExerciseLabel.text = chestExercise.rawValue
            }
        }
        
        if let legExercises = model.legExercise {
            //Leg exercise
            _ = legExercises.map { legExercise in
                armExerciseLabel.text = legExercise.rawValue
            }
        }
        
    }
}
