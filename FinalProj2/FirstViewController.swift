//
//  FirstViewController.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/7/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController  {

    var foodData = [food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        food.getfood(withLocation: "chicken") { (results:([food])) in
           for result in results {
               print("&q=\(result)\n\n")
           }
        }
        
        //updateFood(location: <#T##String#>)
    
    }
    func updateFood (location:String) {
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return foodData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let foodObject = foodData[indexPath.row]
        
        cell.textLabel?.text = foodObject.title
        cell.textLabel?.text = foodObject.showurl
        //cell.imageView?.image = foodObject.image
        
        /*
        if let imageURL = URL(string: foodObject.imageURL) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        cell.imageView?.image = image
                    }
                }
            }
        }*/
        
        return cell
    
    }
 


}

