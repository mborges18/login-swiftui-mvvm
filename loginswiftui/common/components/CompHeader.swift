//
//  CompHeader.swift
//  loginswiftui
//
//  Created by Márcio Borges on 01/10/23.
//

import SwiftUI

struct CompHeader: View {
    var title: String
    var icon: String
    var subTitle: String
    var description: String

    var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.custom("Stellar-Bold", size: 38))
            Image(systemName: icon)
                .font(.custom("", size: 26))
                .padding(.bottom, 6)
        }
        
        VStack {
            Text(subTitle)
                .font(.custom("Stellar-Bold", size: 20))
                .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline).bold()
            Text(description)
                .font(.custom("Stellar-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .leadingLastTextBaseline)
                .padding(.top, 1)
    
        }
    }
}
