//
//  AccessView.swift
//  loginswift
//
//  Created by Márcio Borges on 26/07/23.
//

import SwiftUI

struct AccessView: View {

    @State var currentPage = 0
    
    var rightButtonText: String? = nil
    var leftButtonText: String? = nil
    var rightButtonAction: () -> Void = {}
    var leftButtonAction: () -> Void = {}

    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentPage) {
                SignInView().tag(0)
                SignUpView().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            HStack (spacing: 0) {
                Button(action: {
                    leftButtonAction()
                    withAnimation { currentPage = 0 }
                }) {
                    Text("ACESSAR").padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .fontWeight(.bold)
                        .font(.custom("Stellar-Bold", size: 14))
                        .background(currentPage == 0 ? Color(hex: 0x004DC1) : .white)
                        .foregroundColor(currentPage == 0 ? .white : .black)
                }
                Button(action: {
                    rightButtonAction()
                    withAnimation { currentPage = 1 }
                }) {
                    Text("CADASTRAR").padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .fontWeight(.bold)
                        .font(.custom("Stellar-Bold", size: 14))
                        .background (currentPage == 1 ? Color(hex: 0x004DC1) : .white)
                        .foregroundColor(currentPage == 1 ? .white : .black)
                }
            }
            .mask {
                RoundedRectangle(cornerRadius: 10)
            }
            .shadow(color: Color.gray, radius: 0.5, x: 0.5, y: 0.5)
            .shadow(color: Color.gray, radius: 0.5, x: -0.5, y: -0.5)
            .padding(14)
            
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct AccessView_Previews: PreviewProvider {
    static var previews: some View {
        AccessView()
    }
}
