//
//  VIewModel.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    
    @Published  var value = "0"
    @Published  var number: Double = 0
    @Published  var currentOperation: Operations = .none
    
    
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, . six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    //MARK: Tap Button Method
    func didTap(item: Buttons) {
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                    value = formatResult(-currentValue)
            }
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    //MARK: Helper Calculate Method
    
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
           return number + currentValue
        case .substract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        case .none:
            return currentValue
        }
    }
    
    
    //MARK: Remove last zero
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    //MARK: Size of Buttons Methods
    
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalZeroSpacing: CGFloat = 4 * spacing
        let columns: CGFloat = 4
        let totalWidth = UIScreen.main.bounds.width
        if item == .zero {
            return (totalWidth - totalZeroSpacing) / columns * 2
        }
        return (totalWidth - totalSpacing) / columns
    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let columns: CGFloat = 4
        let totalWidth = UIScreen.main.bounds.width
        return (totalWidth - totalSpacing) / columns
    }
}
