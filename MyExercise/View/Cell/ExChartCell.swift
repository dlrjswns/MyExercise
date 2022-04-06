//
//  ExChartCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

struct ExChartData {
    let exerciseName: String
    let exerciseType: DayExercise
}

struct DayExercise {
    let chestExercise: [ChestExercise]?
    let backExercise: [BackExercise]?
    let legExercise: [LegExercise]?
    let shoulderExercise: [ShoulderExercise]?
    let armExercise: [ArmExercise]?
}

enum ChestExercise: String {
    case chestDBPress = "체스트 덤벨 프레스"
    case chestBBPress = "체스트 바벨 프레스"
    case flyChest = "플라이 체스트"
}

enum BackExercise: String {
    case latPullDown = "랫 풀 다운"
    case deadLift = "데드리프트"
    case oneArmDBRow = "원 암 덤벨로우"
    case BBRow = "바벨 로우"
}

enum LegExercise: String {
    case legCurl = "레그 컬"
    case BBSquat = "바벨 스쿼트"
    case DBSquat = "덤벨 스쿼트"
}

enum ShoulderExercise: String {
    case DBShoulderPress = "덤벨 숄더 프레스"
    case BBShoulderPress = "바벨 숄더 프레스"
    case sideRaise = "사이드 레터럴 레이즈"
    case frontRaise = "프론트 레터럴 레이즈"
}

enum ArmExercise: String {
    case oneArmDBCurl = "원 암 덤벨 컬"
    case oneArmBBCurl = "원 암 바벨 컬"
    case cablePushDown = "케이블 푸시 다운"
    case narrowBBPress = "내로우 바벨 프레스"
}

class ExChartCell: UITableViewCell {
    
    static let identifier = "ExChartCell"
    
    private let exerciseNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 1
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
        exerciseNameLabel.text = nil
    }
    
    public func configureCell(with model: ExChartData) {
        if let chestEx = model.exerciseType.chestExercise {
            // chest day
            _ = chestEx.map { chestExercise in
                exerciseNameLabel.text = chestExercise.rawValue
            }
        }
        
        if let backEx = model.exerciseType.backExercise {
            // back day
            _ = backEx.map { backExercise in
                exerciseNameLabel.text = backExercise.rawValue
            }
        }
        
        if let shoulderEx = model.exerciseType.shoulderExercise {
            // shoulder day
            _ = shoulderEx.map { shoulderExercise in
                exerciseNameLabel.text = shoulderExercise.rawValue
            }
        }
        
        if let legEx = model.exerciseType.legExercise {
            // leg day
            _ = legEx.map { legExercise in
                exerciseNameLabel.text = legExercise.rawValue
            }
        }
        
        if let armEx = model.exerciseType.armExercise {
            // arm day
            _ = armEx.map { armExercise in
                exerciseNameLabel.text = armExercise.rawValue
            }
        }
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
