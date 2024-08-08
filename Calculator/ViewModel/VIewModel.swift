//
//  VIewModel.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import Foundation

class ViewModel {
    static let shared = ViewModel()
    private init() {}
    
    let buttons: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, . six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
}
