//
//  CompButton.swift
//  loginswiftui
//
//  Created by Márcio Borges on 01/10/23.
//

import SwiftUI

struct CompButton: View {
    var title: String
    var icon: String?
    var action: () -> Void

    var body: some View {
        Button(action: action
        ) {
            Label(title.uppercased(), systemImage: icon!)
                .padding(.vertical, 5)
                .fontWeight(.none)
                .foregroundStyle(.white)
                .frame(maxWidth:.infinity)
                .font(.custom("Stellar-Bold", size: 14))
            
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius:8))
        .controlSize(.large)
        .accentColor(Color(hex: 0x004DC1))
        .shadow(color: Color.gray, radius: 0.5, x: 0.5, y: 0.5)
        .shadow(color: Color.gray, radius: 0.5, x: -0.5, y: -0.5)
    }
}
