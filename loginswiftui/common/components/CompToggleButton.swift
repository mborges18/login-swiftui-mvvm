//
//  ToggleButton.swift
//  loginswiftui
//
//  Created by Márcio Borges on 01/10/23.
//

import SwiftUI

struct CompToggleButton: View {
    @Binding var isKeepConnected: Bool
    
    var body: some View {
        Toggle("Continuar conectado", isOn: $isKeepConnected)
            .toggleStyle(
                ColoredToggleStyle(label: "Continuar conectado",
                                   onColor: Color(hex: 0x004DC1).opacity(0.4),
                                   offColor: Color(hex: 0x000000).opacity(0.1),
                                   onThumbColor: Color(hex: 0x004DC1)))
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var onThumbColor = Color.white
    var offThumbColor = Color.gray
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {

            
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 28)
                    .overlay(
                        Circle()
                            .fill(configuration.isOn ? onThumbColor : offThumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1), value: 2)
            }
            Spacer()
            Text(label).font(.custom("Stellar-Regular", size: 15)).frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
        }
        .font(.title)
    }
}
