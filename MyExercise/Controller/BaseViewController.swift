//
//  BaseViewController.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/06.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    //MARK: -init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        
    }
    
    
}
