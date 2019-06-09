//
//  TodoListTableViewController.swift
//  Taskflyer
//
//  Created by Maze Geek on 6/6/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
var itemArray = [Item]()
    
    // User Defaults declaration
//    let defaults = UserDefaults.standard
 let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
   
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Dog Food"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Eggs "
        itemArray.append(newItem3)
     
//        if let  items = defaults.array(forKey: "TodoListArray") as? [Item] {
//          itemArray = items
//        }
        
        
        
    }
 
    //MARK: Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // ternary operator
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true{
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
        
    }
    
    //MARK: Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
     
        
         tableView.reloadData()

         tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: Add new Item
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Task Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when the user pressed the button and add item
           let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            let encoder = PropertyListEncoder()
            do{
            let data = try encoder.encode(self.itemArray)
                try data.write(to: self.dataFilePath!)
            } catch {
                print("Error encoding item array \(error)")
            }
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
