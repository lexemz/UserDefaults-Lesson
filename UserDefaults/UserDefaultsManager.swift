//
//  UserDefaultsManager.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let UD = UserDefaults.standard
    private let key = "strings"
    
    private init() {}

    func setData(string: String) {
        var strings = fetchData()
        strings.append(string)
        UD.set(strings, forKey: key)
    }
    
    func removeData(at index: Int) {
        var strings = fetchData()
        strings.remove(at: index)
        UD.set(strings, forKey: key)
    }
    
    func fetchData() -> [String] {
        if let strings = UD.value(forKey: key) as? [String] {
            return strings
        }
        return []
    }
}
