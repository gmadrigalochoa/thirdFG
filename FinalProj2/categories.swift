//
//  categories.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/25/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import UIKit


var chosen = String()
var foodDetailInfoArray: [String] = []

var pickerMain: [String] = ["Condiments", "Dairy", "Fruits", "Grains", "Protein", "Vegetables"]
var selected: [String] = [String]()
var CondimentTitle: [String] = ["Ketchup", "Mustard", "Mayo", "BBQ", "Tapatio"]
var DairyTitle: [String] = ["Milk", "Cheddar Cheese", "Mozzarella Cheese", "Parmesan Cheese", "Yogurt"]
var FruitTitle: [String] = ["Apple", "Avocado", "Banana", "Orange", "Strawberry", "Lemon"]
var MeatTitle: [String] = ["Beef", "Chicken", "Duck", "Lamb", "Pork"]
var PastaTitle: [String] = ["Angel Hair", "Farfalle", "Spagetti", "Mein Noodles", "Rice Noodles"]
var VeggieTitle: [String] = ["Broccoli", "Carrot", "Corn", "Lettuce", "Onion"]


class categories: UITableViewController  {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return pickerMain[section]
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        returnedView.backgroundColor = UIColor(red:0.94, green:0.79, blue:0.84, alpha:1.0)//.lightGray
        
        let label = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.size.width, height: 20))
        label.text = pickerMain[section]
        label.textColor = .black
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return pickerMain.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0:
            return CondimentTitle.count
        case 1:
            return DairyTitle.count
        case 2:
            return FruitTitle.count
        case 3:
            return PastaTitle.count
        case 4:
            return MeatTitle.count
        case 5:
            return VeggieTitle.count
            
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCat", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = CondimentTitle[indexPath.row]
            break
        case 1:
            cell.textLabel?.text = DairyTitle[indexPath.row]
            break
        case 2:
            cell.textLabel?.text = FruitTitle[indexPath.row]
            break
        case 3:
            cell.textLabel?.text = PastaTitle[indexPath.row]
            break
        case 4:
            cell.textLabel?.text = MeatTitle[indexPath.row]
            break
        case 5:
            cell.textLabel?.text = VeggieTitle[indexPath.row]
            break
            
        default:
            break
        }
        
        return cell
    }
    
    private var todoItems = ToDoItem.getMockData()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //var itemloc = [indexPath.section] + [indexPath.row]
        //let itemloc = [indexPath.row]
        
        let cell = self.tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text
        
        let title1 = text!
        print("actual thing -----\(title1)")
        
        
        chosen = title1

        foodDetailInfoArray.append(chosen)
        FoodSelection.instance.addToSelection(add: ToDoItem(title: chosen))
        //self.addNewToDoItem(title: title1)
        
      //  print("array -----\(FoodSelection.selection)")
        
    }
    
    
}

