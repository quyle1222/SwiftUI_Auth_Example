//
//  LocalStorage.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

enum Key: String {
    case token = "TOKEN"
    case userId = "USER_ID"
}

import Foundation
class LocalStorage {
    let storage = UserDefaults.standard
    
    func setString(key: Key,value:String) {
        storage.set(value, forKey: key.rawValue)
    }
    
    func getString(key: Key)-> String? {
        return storage.string(forKey: key.rawValue)
    }
    
    func clearStorage() {
        let domain = Bundle.main.bundleIdentifier!
        storage.removePersistentDomain(forName: domain)
        storage.synchronize()
    }
}
