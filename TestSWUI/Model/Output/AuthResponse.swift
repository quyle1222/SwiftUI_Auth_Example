//
//  AuthResponse.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
struct AuthResponse : Codable {
    var success : Bool
    var message :String?
    var errorCode : String?
    var data: AuthResponseData?
}

struct AuthResponseData: Codable {
    var token:String?
}
