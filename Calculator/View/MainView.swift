//
//  MainView.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .font(.system(size: 80, weight: .light))
                        .foregroundColor(.white)
                        .padding(.horizontal, 29)
                }
                
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                viewModel.didTap(item: item)
                            }, label: {
                                Text("\(item.rawValue)")
                                    .frame(
                                        width: viewModel.buttonWidth(item: item),
                                        height: viewModel.buttonHeight())
                                    .background(item.buttonsColor)
                                    .foregroundColor(item.buttonsFontColor)
                                    .font(.system(size: 30))
                                    .cornerRadius(40)
                            })
                            
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
