//
//  BaseResponse.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import Foundation
struct BaseResponse: Codable {
    var success : Bool
    var message :String?
    var errorCode : String?
}
