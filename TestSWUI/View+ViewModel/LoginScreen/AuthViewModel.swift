//
//  AuthViewModel.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import Foundation

class AuthViewModel : ObservableObject {
    @Published var isLoginSuccess : Bool  = false
    @Published var username:String = "quyle1222"
    @Published var password:String = "admin"
    
    func handleLogin(){
        let rawData =  AuthPost(username: username, password :password)
        let data = try? JSONEncoder().encode(rawData)
        SessionNetwork().restAPI(url: "auth/login", method: .post, data: data) { [self] Data, URLResponse, Error in
            let dict = try! JSONDecoder().decode(AuthResponse.self, from: Data!)
            print(".....dict",dict)
//            self.isLoginSuccess = true
        }
    }
}
