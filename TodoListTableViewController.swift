//
//  TodoListTableViewController.swift
//  Taskflyer
//
//  Created by Maze Geek on 6/6/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
let itemArray = ["Find Mike", "Buy Eggs", "TLC Papers Works" ]
    
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
    
    
}
