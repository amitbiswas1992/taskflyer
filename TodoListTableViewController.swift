//
//  TodoListTableViewController.swift
//  Taskflyer
//
//  Created by Maze Geek on 6/6/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
var itemArray = ["Find Mike", "Buy Eggs", "TLC Papers Works" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   

        
    }
 
    //MARK: Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    //MARK: Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
         tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: Add new Item
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Task Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when the user pressed the button and add item
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            
        }
        // Adding texts inside the alert placeholder
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
           textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
