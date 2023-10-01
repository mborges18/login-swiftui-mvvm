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
        if $viewModel.wrappedValue.validate() {
            $viewModel.wrappedValue.signIn()
        } else {
            $handlerFocus.wrappedValue = false
        }
    }
    
    var body: some View {
        VStack {
            CompHeader(title: "Acessar",
                       icon: "lock.open.fill",
                       subTitle: "Seja bem vindo!",
                       description: "Informe sua senha e email para acessar a sua área")
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
            CompTextField(
                textField: TextField("E-mail", text: $viewModel.model.email),
                imageName: "at",
                textError: $viewModel.wrappedValue.errorEmail,
                focusedField: $handlerFocus
            ).padding(.top, 0)

            CompSecureField(
                secureField: SecureField("Senha", text: $viewModel.model.password),
                imageName: "key",
                textError: $viewModel.wrappedValue.errorPassword,
                focusedField: $handlerFocus
            ).padding(.top, 5)
            
            CompToggleButton(isKeepConnected: $viewModel.model.isKeepConnected)
            
            CompButton(title: "Entrar", icon: "arrow.forward.to.line", action: signIn).padding(.top, 10)
            
        }.padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
