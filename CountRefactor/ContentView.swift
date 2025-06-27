//
//  ContentView.swift
//  CountRefactor
//
//  Created by 大内亮 on 2025/06/27.
//

import SwiftUI

struct ContentView: View {
    @State var number: Int = 0
    @State var result: String = " "
    
    var body: some View {
        VStack {
            Text("\(result)")
                .font(.system(size: 32))
            
            Text("\(number)")
                .frame(width: 300, height: 100)
                .font(.system(size: 48))
                .foregroundColor(
                    number > 0 ? .red :
                    number == 0 ? .black :
                    .blue
                )
                
            HStack {
                Button {
                    number += 1
                    result = decideWinningColor(number: number)
                } label: {
                    ButtonTextComponent(textLabel: "+", buttonColor: .red)
                }
                Button {
                    number -= 1
                    result = decideWinningColor(number: number)
                } label: {
                    ButtonTextComponent(textLabel: "-", buttonColor: .blue)
                }
            }
        }
        .padding()
    }
    
    func decideWinningColor(number: Int) -> String {
        let winningNumber = 10
        if number >= winningNumber {
            return "やったね！プラス側の勝利！🎉"
        } else if number <= -winningNumber {
            return "おっと！マイナス側の勝ちだ！💥"
        } else {
            return " "
        }
    }

}

#Preview {
    ContentView()
}
