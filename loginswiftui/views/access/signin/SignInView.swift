//
//  SignInView.swift
//  loginswift
//
//  Created by Márcio Borges on 27/07/23.
//

import SwiftUI

struct SignInView: View {

    @State private var viewModel = SignInViewModel()
    @FocusState private var handlerFocus: Bool
    
    func signIn() {
        
        if $viewModel.wrappedValue.signIn() {

        } else {
            $handlerFocus.wrappedValue = false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("ACESSAR")
                    .font(.custom("Stellar-Bold", size: 38))
                Image(systemName: "lock.open.fill")
                    .font(.custom("", size: 26))
                    .padding(.bottom, 6)
            }
            
            VStack {
                Text("Seja bem vindo!")
                    .font(.custom("Stellar-Bold", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline).bold()
                Text("Informe sua senha e email para acessar a sua área")
                    .font(.custom("Stellar-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leadingLastTextBaseline)
                    .padding(.top, 1)
        
            }.padding(.top, 1)
            
            VStack(alignment: .leading) {
                
                VStack {
                    CompTextField(
                        textField: TextField("E-mail", text: $viewModel.model.email),
                        imageName: "at",
                        textError: $viewModel.wrappedValue.errorEmail,
                        focusedField: $handlerFocus
                    ).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    CompSecureField(
                        secureField: SecureField("Senha", text: $viewModel.model.password),
                        imageName: "key",
                        textError: $viewModel.wrappedValue.errorPassword
                    ).padding(.top, 0)
                    
                    Toggle("Continuar conectado", isOn: $viewModel.model.isKeepConnected)
                        .toggleStyle(
                            ColoredToggleStyle(label: "Continuar conectado",
                                               onColor: Color(hex: 0x004DC1).opacity(0.4),
                                               offColor: Color(hex: 0x000000).opacity(0.1),
                                               onThumbColor: Color(hex: 0x004DC1))).padding(.top, 20)
                    
                    
                    Button(action: signIn
                    ) {
                        Label("ENTRAR", systemImage: "arrow.forward.to.line")
                            .padding(.vertical, 5)
                            .fontWeight(.none)
                            .foregroundStyle(.white)
                            .frame(maxWidth:.infinity)
                            .font(.custom("Stellar-Bold", size: 14))
                        
                    }
                    .padding(.top, 10)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius:8))
                    .controlSize(.large)
                    .accentColor(Color(hex: 0x004DC1))
                    .shadow(color: Color.gray, radius: 0.5, x: 0.5, y: 0.5)
                    .shadow(color: Color.gray, radius: 0.5, x: -0.5, y: -0.5)
                
                }.padding(.top, 20)
            }
        }.padding()
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
                    .frame(width: 50, height: 29)
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
