//
//  CustomTypesTable.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import UIKit

class CustomTypesTable: UITableViewController {
    private var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetching data from UserDefaults
        persons = UserDefaultsManagerForCustomTypes.shared.fetchData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(row: persons.count, section: 0)

        let person = Person.generateRandomPerson()

        persons.append(person)
        tableView.insertRows(at: [indexPath], with: .automatic)

        // Saving new data in UserDefaults
        UserDefaultsManagerForCustomTypes.shared.setData(person: person)
    }
}

// MARK: - Table view data source

extension CustomTypesTable {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = persons[indexPath.row].fullName

        cell.contentConfiguration = content

        return cell
    }
}

// MARK: - Table view delegate

extension CustomTypesTable {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)

            // Removing Data in UserDefaults
            UserDefaultsManagerForCustomTypes.shared.removeData(at: indexPath.row)
        }
    }
}
