//
//  BaseView.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

class BaseView: UIView {
    
    //MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -configure
    func configureUI() {
        
    }
}
