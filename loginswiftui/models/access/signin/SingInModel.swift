//
//  SingInModel.swift
//  loginswiftui
//
//  Created by Márcio Borges on 30/09/23.
//

import Foundation

struct SignInModel: Encodable {
    var email: String
    var password: String
    var isKeepConnected: Bool = false
}
