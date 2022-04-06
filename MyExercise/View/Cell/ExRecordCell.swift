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
}

enum ExerciseType: String {
    case chest = "Chest"
    case back = "Back"
    case arm = "Arm"
    case leg = "Leg"
    case shoulder = "Shoulder"
}

protocol ExRecordCellDelegate: AnyObject {
    func didTapLikeButton()
}

class ExRecordCell: UICollectionViewCell {
    
    static let identifier = "ExRecordCell"
    
    weak var delegate: ExRecordCellDelegate?
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let exerciseTypeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let likeButton: UIButton = {
       let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        let image = UIImage(systemName: "heart", withConfiguration: config)?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        return button
    }()
    
    let exerciseChartView = ExChartView()
    
    //MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        exerciseTypeLabel.text = nil
    }
    
    //MARK: -Action
    @objc private func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    //MARK: -Configure
    private func configureCell() {
        contentView.backgroundColor = .systemGray3
        contentView.layer.cornerRadius = 20
        contentView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        contentView.addSubview(exerciseTypeLabel)
        exerciseTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseTypeLabel.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor).isActive = true
        exerciseTypeLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20).isActive = true
        
        contentView.addSubview(exerciseChartView)
        exerciseChartView.translatesAutoresizingMaskIntoConstraints = false
        exerciseChartView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        exerciseChartView.topAnchor.constraint(equalTo: exerciseTypeLabel.bottomAnchor, constant: 10).isActive = true
        
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    public func configureCell(with model: ExRecordData) {
        usernameLabel.text = model.username
        switch model.exerciseType {
            case .chest:
                exerciseTypeLabel.text = ExerciseType.chest.rawValue
            case .back:
                exerciseTypeLabel.text = ExerciseType.back.rawValue
            case .arm:
                exerciseTypeLabel.text = ExerciseType.arm.rawValue
            case .leg:
                exerciseTypeLabel.text = ExerciseType.leg.rawValue
            case .shoulder:
                exerciseTypeLabel.text = ExerciseType.shoulder.rawValue
        }
    }
}
