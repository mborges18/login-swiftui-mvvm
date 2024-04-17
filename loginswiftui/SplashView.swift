//
//  SplashView.swift
//  loginswiftui
//
//  Created by Márcio Borges on 27/07/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            withAnimation {
                AccessView()
            }
        } else {
            AView(isActive: $isActive)
        }
        
    }
}

struct AView: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            Color(hex: 0x004DC1).ignoresSafeArea()
            VStack {
                Text("LOGIN MVVM")
                    .font(.custom("Impact", size: 40))
                    .foregroundColor(.white)
                Text("Desenvolvido em swift")
                    .font(.custom("Impact", size: 16))
                    .foregroundColor(.white)
            }
                
        }.edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isActive = true
                }
            }
    }

}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
