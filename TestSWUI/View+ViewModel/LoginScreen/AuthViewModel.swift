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
    
    init() {
        checkLogin()
    }
    
    func checkLogin(){
        let token:String? = LocalStorage().getString(key: .token)
        guard token != nil && token?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty != true else {return}
        self.isLoginSuccess = true
    }
    
    func handleLogin(){
        let rawData =  AuthPost(username: username.description, password :password.description)
        let json = try? JSONEncoder().encode(rawData)
        SessionNetwork().restAPI(url: "auth/login", method: .post, data: json) { [weak self] data, response, error in
            guard error == nil else {
                return
            }
            do {
                let dict = try JSONDecoder().decode(AuthResponse.self, from: data!) as AuthResponse
                if dict.success {
                    DispatchQueue.main.async {
                        LocalStorage().setString(key: .token, value: dict.data?.token ?? "")
                        self?.isLoginSuccess = true
                    }
                }else {
                    LocalStorage().clearStorage()
                }
            } catch let catchError {
                print("JSON Error \(catchError.localizedDescription)")
            }
        }
    }
}
