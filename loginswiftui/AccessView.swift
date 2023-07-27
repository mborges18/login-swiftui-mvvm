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
            
            //TabBarView(currentItem: self.$currentPage)
            
            HStack (spacing: 0) {
                Button(action: {
                    leftButtonAction()
                    withAnimation { currentPage = 0 }
                }) {
                    Text("Acessar").padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .background(currentPage == 0 ? Color(hex: 0x004DC1) : .white)
                        .foregroundColor(currentPage == 0 ? .white : .black)
                }
                Button(action: {
                    rightButtonAction()
                    withAnimation { currentPage = 1 }
                }) {
                    Text("Cadastrar").padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .background (currentPage == 1 ? Color(hex: 0x004DC1) : .white)
                        .foregroundColor(currentPage == 1 ? .white : .black)
                }
            }
            .mask {
                RoundedRectangle(cornerRadius: 10)
            }
            .frame(width:.infinity)
            .shadow(radius: 10)
            .padding(30)
            
        }
    }
}

struct TabBarView: View {
    
    @Binding var currentItem : Int
    var tabItens = ["Acessar", "Cadastrar"]
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(Array(zip(self.tabItens.indices, self.tabItens)),
                        id:\.0,
                        content: {
                    index, name in
                    TabBarItem(
                        currentTab: self.$currentItem,
                        tabName: name,
                        tab: index
                    )
                })
            }
        }.padding(.vertical, 20)
    }
}

struct TabBarItem: View {
    
    @Binding var currentTab: Int
    var tabName: String
    var tab: Int
    
    var body: some View {
        
        Button(action: {
            self.currentTab = tab
        }) {
            Text(tabName)
                .padding(.vertical, 8)
                .frame(width: 110)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius:8))
        .controlSize(.large)
        .accentColor(Color(hex: 0x004DC1))
        .shadow(radius: 10)
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
