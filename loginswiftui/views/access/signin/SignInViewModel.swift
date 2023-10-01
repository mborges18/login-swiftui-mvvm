//
//  SignInViewModel.swift
//  loginswiftui
//
//  Created by Márcio Borges on 30/09/23.
//

import Foundation
import Alamofire

struct SignInViewModel {
    
    private var invalidField = "Campo inválido"
    var errorEmail = ""
    var errorPassword = ""
    var model = SignInModel(email: "", password: "")
    
    mutating func validate() -> Bool {
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
    
    func signIn() {
        AF.request("https://api-souls-and-cells-792613245.development.catalystserverless.com/server/signin",
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
}
