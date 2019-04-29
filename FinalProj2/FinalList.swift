//
//  FinalList.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/25/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import UIKit

class FinalList: UITableViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Final List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(FinalList.didTapAddItemButton(_:)))
        
        FoodSelection.instance.setFinalListController(fl: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    private var todoItems : [ToDoItem]
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return FoodSelection.instance.selection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellList", for: indexPath)
        
        
        
        if indexPath.row < FoodSelection.instance.selection.count
        {
            
            
            let item = FoodSelection.instance.selection[indexPath.row]
            cell.textLabel?.text = item.title
            
            //let accessory: UITableViewCell.AccessoryType = item.done ? .checkmark : .none
            //cell.accessoryType = accessory
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        if indexPath.row < FoodSelection.instance.selection.count
        {
            let item = FoodSelection.instance.selection[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        // Create an alert
        let alert = UIAlertController(
            title: "New food item",
            message: "Insert the title of the new food item:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text
            {
                self.addNewToDoItem(title: title)
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    func addFromOther() {
        self.addNewToDoItem(title: chosen)
        
    }
    
    public func addNewToDoItem(title: String)
    {
        
        
        // The index of the new item will be the current item count
        let newIndex = FoodSelection.instance.selection.count
        print("count of todotiems \(newIndex)")
        // Create new item and add it to the todo items list
        FoodSelection.instance.selection.append(ToDoItem(title: title))
        
        tableView.reloadData()
     //   print("added \(FoodSelection.selection)")
        // Tell the table view a new row has been created
        //tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if indexPath.row < FoodSelection.instance.selection.count
        {
            FoodSelection.instance.selection.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    
    
}

