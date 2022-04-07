//
//  EXRecordCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

struct ExRecordData {
    let username: String
    let exerciseType: ExerciseType
    let exerciseDate: String
    let dayExercise: DayExercise
}

enum ExerciseType: String {
    case chest = "Chest"
    case back = "Back"
    case arm = "Arm"
    case leg = "Leg"
    case shoulder = "Shoulder"
}

protocol ExRecordCellDelegate: AnyObject {
    func didTapLikeButton(with model: ExRecordData)
}

class ExRecordCell: UICollectionViewCell {
    
    static let identifier = "ExRecordCell"
    
    private var exRecordModel: ExRecordData?
    
    private var isLiked: Bool = false
    
    weak var delegate: ExRecordCellDelegate?
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let exerciseDateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let likeButton: UIButton = {
       let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        let image = UIImage(systemName: "heart", withConfiguration: config)?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        return button
    }()
    
    let exerciseChartView = ExChartView()
    
    //MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        exerciseDateLabel.text = nil
//        likeButton.setBackgroundImage(nil, for: .normal)
    }
    
    //MARK: -Action
    @objc private func didTapLikeButton() {
        guard let exRecordModel = exRecordModel else {
            return
        }
        delegate?.didTapLikeButton(with: exRecordModel)
        likeButtonImageToggle()
    }
    
    private func likeButtonImageToggle() {
        if isLiked == false {
            let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
            let image = UIImage(systemName: "heart.fill", withConfiguration: config)?.withTintColor(.red, renderingMode: .alwaysOriginal)
            likeButton.setBackgroundImage(image, for: .normal)
            isLiked = true
        }
        else {
            let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
            let image = UIImage(systemName: "heart", withConfiguration: config)?.withTintColor(.red, renderingMode: .alwaysOriginal)
            likeButton.setBackgroundImage(image, for: .normal)
            isLiked = false
        }
    }
    
    private func addAction() {
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    }
    
    //MARK: -Configure
    private func configureCell() {
        
        contentView.backgroundColor = .systemGray3
        contentView.layer.cornerRadius = 20
        contentView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        contentView.addSubview(exerciseDateLabel)
        exerciseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseDateLabel.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor).isActive = true
        exerciseDateLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20).isActive = true
        
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(exerciseChartView)
        exerciseChartView.translatesAutoresizingMaskIntoConstraints = false
        exerciseChartView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        exerciseChartView.topAnchor.constraint(equalTo: exerciseDateLabel.bottomAnchor, constant: 10).isActive = true
        exerciseChartView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        exerciseChartView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        exerciseChartView.bottomAnchor.constraint(equalTo: likeButton.topAnchor, constant: -10).isActive = true
        exerciseChartView.exerciseChartTableView.register(ExChartCell.self, forCellReuseIdentifier: ExChartCell.identifier)
    }
    
    public func configureCell(with model: ExRecordData) {
        usernameLabel.text = model.username
        exerciseDateLabel.text = model.exerciseDate
        self.exRecordModel = model
//        switch model.exerciseType {
//            case .chest:
//                exerciseDateLabel.text = ExerciseType.chest.rawValue
//            case .back:
//                exerciseDateLabel.text = ExerciseType.back.rawValue
//            case .arm:
//                exerciseDateLabel.text = ExerciseType.arm.rawValue
//            case .leg:
//                exerciseDateLabel.text = ExerciseType.leg.rawValue
//            case .shoulder:
//                exerciseDateLabel.text = ExerciseType.shoulder.rawValue
//        }
    }
}
