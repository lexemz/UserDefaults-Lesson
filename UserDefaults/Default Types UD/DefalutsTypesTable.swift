//
//  TableViewController.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import UIKit

class DefalutsTypesTable: UITableViewController {
    private var manyStrings: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetching data from UserDefaults
        manyStrings = UserDefaultsManagerForDefaultTypes.shared.fetchData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(row: manyStrings.count, section: 0)

        let savedData = "Row \(indexPath.row)"

        manyStrings.append(savedData)
        tableView.insertRows(at: [indexPath], with: .automatic)

        // Saving data in UserDefaults
        UserDefaultsManagerForDefaultTypes.shared.setData(string: savedData)
    }
}

// MARK: - Table view data source

extension DefalutsTypesTable {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manyStrings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = manyStrings[indexPath.row]

        cell.contentConfiguration = content

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Table view delegate

extension DefalutsTypesTable {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manyStrings.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)

            // Removing Data in UserDefaults
            UserDefaultsManagerForDefaultTypes.shared.removeData(at: indexPath.row)
        }
    }
}
