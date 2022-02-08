//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by Xuemeng Gao on 2/7/22.
//

import UIKit

class TableViewController: UITableViewController {

    let arr = ["Mark", "Bill", "Tom", "Peter", "John"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]
        
        // Adding some comment
        
        return cell
    }
    

}
