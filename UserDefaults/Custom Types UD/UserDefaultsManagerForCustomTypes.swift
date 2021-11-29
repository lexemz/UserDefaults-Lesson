//
//  UserDefaultsManagerForCustomTypes.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import Foundation


class UserDefaultsManagerForCustomTypes {
    static let shared = UserDefaultsManagerForCustomTypes()
    
    private let UD = UserDefaults.standard
    private let key = "model"
    
    private init() {}
}
