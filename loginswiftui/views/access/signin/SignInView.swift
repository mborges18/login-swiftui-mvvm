//
//  SignInView.swift
//  loginswift
//
//  Created by Márcio Borges on 27/07/23.
//

import SwiftUI

struct SignInView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("ACESSAR")
                    .font(.custom("Impact", size: 36))
                Image(systemName: "lock.open.fill")
                    .font(.custom("Arial", size: 30))
            }
            
            VStack {
                Text("Seja bem vindo!")
                    .font(.custom("Arial", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline).bold()
                Text("Informe sua senha e email para acessar a sua área")
                    .font(.custom("Arial", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leadingLastTextBaseline)
            }.padding(.top, 1)
            
            VStack {
                ZStack {
          
                    VStack(alignment: .leading) {
                        Text("Illusion Custom TextField Style").font(.title2).foregroundColor(.white)
                        HStack {
                            NeumorphicStyleTextField(textField: TextField("Search...", text: $text), imageName: "magnifyingglass")
                        }
                    }.padding()
                }
            }
        }.padding()
    }
}

struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.blue)
            textField
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.white)
            .cornerRadius(6)
            .shadow(color: Color.gray, radius: 3, x: 2, y: 2)
            .shadow(color: Color.gray, radius: 3, x: -2, y: -2)

        }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
