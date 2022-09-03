//
//  LoginViewModel.swift
//  Sign in new project
//
//  Created by Abai Kush on 3/9/22.
//

import Foundation

class LoginViewModel{
    
    
    private let username: String = "User"
    private let password: String = "user"

    var isUserAuthorized: ((Bool) -> Void)?
    
    func authorizeUser(login: String, password: String){
        if login.lowercased() == username.lowercased() && password == self.password{
            isUserAuthorized!(true)
        } else {
            isUserAuthorized!(false)
        }
    }
}
