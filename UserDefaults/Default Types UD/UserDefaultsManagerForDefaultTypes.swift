//
//  UserDefaultsManager.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import Foundation

class UserDefaultsManagerForDefaultTypes {
    static let shared = UserDefaultsManagerForDefaultTypes()
    
    private let userDefaults = UserDefaults.standard
    private let key = "strings"
    
    private init() {}
    
    func fetchData() -> [String] {
        if let strings = userDefaults.value(forKey: key) as? [String] {
            return strings
        }
        return []
    }
    
    func setData(string: String) {
        var strings = fetchData()
        strings.append(string)
        userDefaults.set(strings, forKey: key)
    }
    
    func removeData(at index: Int) {
        var strings = fetchData()
        strings.remove(at: index)
        userDefaults.set(strings, forKey: key)
    }
}
