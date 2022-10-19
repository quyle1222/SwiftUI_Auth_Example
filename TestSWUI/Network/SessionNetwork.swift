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
    private let baseURL = "http://localhost:8088/"
    
    func restAPI(url:String, method: MethodRest, data:Data?, handle: @escaping (Data?,URLResponse?,Error?)->Void ){
        guard let serviceUrl = URL(string: baseURL + url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = method.rawValue
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        session.dataTask(with: request,completionHandler: handle ).resume()
    }
}
