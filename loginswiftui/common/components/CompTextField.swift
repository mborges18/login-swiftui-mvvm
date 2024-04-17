//
//  CompTextField.swift
//  loginswiftui
//
//  Created by Márcio Borges on 30/09/23.
//

import SwiftUI

struct CompTextField: View {
    var textField: TextField<Text>
    var imageName: String
    var textError: String?
    @FocusState.Binding var focusedField: Bool
    
    private func handleColor() -> Color {
        if textError!.isEmpty {
            return Color.gray
        } else {
            return Color.red
        }
    }
    
    var body: some View {
        
        HStack {
            Image(systemName: imageName).foregroundColor(handleColor())
            textField.focused($focusedField)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: handleColor(), radius: 0.5, x: 0.5, y: 0.5)
        .shadow(color: handleColor(), radius: 0.5, x: -0.5, y: -0.5)
        
        Text(textError!).font(.custom("Stellar-Regular", size: 15)).frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline).foregroundColor(.red)
            .padding(.bottom, 10)
    }
}
