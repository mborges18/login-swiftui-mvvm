//
//  SignInViewModel.swift
//  loginswiftui
//
//  Created by Márcio Borges on 30/09/23.
//

import Foundation

struct SignInViewModel {
  
    private var invalidField = "Campo inválido"
    var errorEmail = ""
    var errorPassword = ""
    var model = SignInModel(email: "", password: "")
    
    mutating func signIn() -> Bool {
        var isValid = true
        
        if model.email.isEmpty {
            errorEmail = invalidField
            isValid = false
        } else {
            errorEmail = ""
        }
        
        if model.password.isEmpty {
            errorPassword = invalidField
            isValid = false
        } else {
            errorPassword = ""
        }
        
        return isValid
    }
}
