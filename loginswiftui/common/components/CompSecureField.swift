//
//  CompSecureField.swift
//  loginswiftui
//
//  Created by Márcio Borges on 30/09/23.
//

import SwiftUI

struct CompSecureField: View {
    var secureField: SecureField<Text>
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
            secureField.focused($focusedField)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: handleColor(), radius: 1, x: 1, y: 1)
        .shadow(color: handleColor(), radius: 1, x: -1, y: -1)
        
        Text(textError!).font(.custom("Stellar-Regular", size: 15)).frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline).foregroundColor(.red).padding(.top, 2)
    }
}

