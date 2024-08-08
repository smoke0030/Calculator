//
//  MainView.swift
//  Calculator
//
//  Created by Сергей on 08.08.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                HStack {
                    Spacer()
                    Text("0")
                        .font(.system(size: 80, weight: .light))
                        .foregroundColor(.white)
                        .padding(.horizontal, 29)
                }
                
                ForEach(ViewModel.shared.buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                //
                            }, label: {
                                Text("\(item.rawValue)")
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight())
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

#Preview {
    MainView()
}
