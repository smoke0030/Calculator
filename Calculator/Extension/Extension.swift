//
//  Extension.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import Foundation

extension Buttons {
    func buttonToOperation() -> Operations {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .substract
        case .multiple:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
  
    }
}
