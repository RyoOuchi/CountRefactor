//
//  ButtonTextComponent.swift
//  CountRefactor
//
//  Created by 大内亮 on 2025/06/27.
//

import SwiftUI

struct ButtonTextComponent: View {
    @State var textLabel: String
    @State var buttonColor: Color
    
    var body: some View {
        Text(textLabel)
            .font(.system(size: 48))
            .foregroundStyle(.white)
            .frame(width: 100, height: 100)
            .background(buttonColor)
    }
}

#Preview {
    ButtonTextComponent(textLabel: "+", buttonColor: .blue)
}
