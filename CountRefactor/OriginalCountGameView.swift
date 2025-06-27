//
//  OriginalCountGameView.swift
//  CountRefactor
//
//  Created by 大内亮 on 2025/06/27.
//

import SwiftUI

struct OriginalCountGameView: View {
    @State var number: Int = 0
    @State var winner: String = ""
    @State var hasWinner: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(
                    winner == "+" ? .red :
                    winner == "-" ? .blue :
                    .clear
                )
                .frame(width: hasWinner ? UIScreen.main.bounds.height * 2 : 0)
                .animation(.easeInOut(duration: 1), value: hasWinner)
                
            VStack(spacing: 50) {
                PlayerComponent(player: "+", playerColor: .red, isPlus: true, number: $number)
                    .rotationEffect(.degrees(180))
                
                PlayerComponent(player: "-", playerColor: .blue, isPlus: false, number: $number)
            }
            .onChange(of: number) { oldValue, newValue in
                if newValue >= 10 {
                    winner = "+"
                    hasWinner = true
                    print("+")
                } else if newValue <= -10 {
                    winner = "-"
                    hasWinner = true
                    print("-")
                } else {
                    winner = ""
                }
            }
            
            Button {
                number = 0
                winner = ""
                hasWinner = false
            } label: {
                Text("Reset")
                    .foregroundStyle(
                        winner == "+" ? .blue :
                        winner == "-" ? .red : .clear
                    )
                    .font(.system(size: 72, weight: .bold, design: .default))
                    .rotationEffect(winner == "-" ? .degrees(180) : .degrees(0))
            }
            .opacity(hasWinner ? 1 : 0)
            .animation(.easeInOut(duration: 1), value: hasWinner)

        }
    }
}

#Preview {
    OriginalCountGameView()
}
