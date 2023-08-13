//
//  loginswiftuiApp.swift
//  loginswiftui
//
//  Created by Márcio Borges on 27/07/23.
//

import SwiftUI

@main
struct loginswiftuiApp: App {
    init(){
        for family in UIFont.familyNames {
             print(family)
             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
    }
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
