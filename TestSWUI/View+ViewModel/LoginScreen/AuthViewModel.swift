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
        let json = try? JSONEncoder().encode(rawData)
        SessionNetwork().restAPI(url: "auth/login", method: .post, data: json) { [weak self] data, response, error in
            guard error == nil else {
                return
            }
            do {
                let dict = try JSONDecoder().decode(AuthResponse.self, from: data!) as AuthResponse
                if dict.success {
                    DispatchQueue.main.async {
                        self?.isLoginSuccess = true
                    }
                }
            } catch let catchError {
                print("JSON Error \(catchError.localizedDescription)")
            }
         
        }
    }
}
