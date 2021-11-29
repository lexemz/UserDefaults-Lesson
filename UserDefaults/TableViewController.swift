//
//  TableViewController.swift
//  UserDefaults
//
//  Created by Igor on 29.11.2021.
//

import UIKit

class TableViewController: UITableViewController {
    private var tableViewData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = UserDefaultsManager.shared.fetchData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(row: tableViewData.count, section: 0)
        
        let savedData = "Row \(indexPath.row)"
        
        tableViewData.append(savedData)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        // Saving new data in UserDefaults
        UserDefaultsManager.shared.setData(string: savedData)
    }
}

// MARK: - Table view data source

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tableViewData[indexPath.row]

        cell.contentConfiguration = content

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Table view delegate

extension TableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableViewData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            UserDefaultsManager.shared.removeData(at: indexPath.row)
        }
    }
}
