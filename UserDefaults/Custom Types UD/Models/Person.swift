//
//  Person.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import Foundation

struct Person: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func generateRandomPerson() -> Person {
        let names = ["Dima", "Igor", "Vasily", "Oleg"]
        let surnames = ["Buzykin", "Ivanov", "Stepanov", "Usov"]
        
        return Person(name: names.randomElement()!, surname: surnames.randomElement()!)
    }
}
