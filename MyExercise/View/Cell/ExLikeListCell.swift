//
//  ExLikeListCell.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import UIKit

class ExLikeListCell: UITableViewCell {
    
    static let identifier = "ExLikeListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
