//
//  PlayerComponent.swift
//  CountRefactor
//
//  Created by 大内亮 on 2025/06/27.
//

import SwiftUI

struct PlayerComponent: View {
    @State var player: String
    @State var playerColor: Color
    @State var isPlus: Bool
    @Binding var number: Int
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(number)")
                .font(.system(size: 72, weight: .bold, design: .default))
                .foregroundColor(
                    number > 0 ? .red :
                    number == 0 ? .black :
                    .blue
                )
            Text("押しまくって \(player)！")
                .font(.largeTitle)
            Button {
                if isPlus {
                    number += 1
                } else {
                    number -= 1
                }
            } label: {
                ButtonTextComponent(textLabel: player, buttonColor: playerColor)
            }
        }
    }
}

#Preview {
    PlayerComponent(player: "+", playerColor: .red, isPlus: true, number: .constant(0))
}
