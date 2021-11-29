//
//  UserDefaultsManagerForCustomTypes.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import Foundation

class UserDefaultsManagerForCustomTypes {
    static let shared = UserDefaultsManagerForCustomTypes()
    
    private let userDefaults = UserDefaults.standard
    private let key = "model"
    
    private init() {}
    
    func fetchData() -> [Person] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let persons = try? JSONDecoder().decode([Person].self, from: data) else { return [] }
        return persons
    }
    
    func setData(person: Person) {
        var persons = fetchData()
        persons.append(person)
        guard let data = try? JSONEncoder().encode(persons) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func removeData(at index: Int) {
        var persons = fetchData()
        persons.remove(at: index)
        guard let data = try? JSONEncoder().encode(persons) else { return }
        userDefaults.set(data, forKey: key)
    }
}
