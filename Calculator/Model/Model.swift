//
//  Model.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import Foundation
import SwiftUI


enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiple = "x"
    case equal = "="
    case percent = "%"
    case negative = "+/-"
    case decimal = ","
    case clear = "AC"
    case divide = "/"
    
    
    var buttonsColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.grayCalc
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.orangeCalc
        default:
            return Color.dardGrayCalc
        }
    }
    
    var buttonsFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.black
        default:
            return Color.white
        }
    }
    
}
