//
//  Session.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
enum MethodRest : String {
    case post = "POST"
    case get = "GET"
}
class SessionNetwork {
    private let session = URLSession.shared
    private let baseURL = "http://192.168.120.238:8088/"
    
    func restAPI(url:String, method: MethodRest, data:Data?, handle: @escaping (Data?,URLResponse?,Error?) ->Void) {
        guard let serviceUrl = URL(string: baseURL + url) else { return }
        var request = URLRequest(url: serviceUrl)
        let token: String? = LocalStorage().getString(key: .token)
        request.httpMethod = method.rawValue
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        if let token = token, token.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty != true {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = data
        session.dataTask(
            with: request,
            completionHandler: handle
        ).resume()
    }
}
