//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
