//
//  Date+extension.swift
//  MyExercise
//
//  Created by 이건준 on 2022/04/07.
//

import Foundation

extension Date {
    func fetchDateToString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
