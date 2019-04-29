//
//  FirstViewController.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/7/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController{

    var foodData = [food]()
    var addedFood = false
    var timer = Timer()

    
    
    override func viewDidDisappear(_ animated: Bool) {
        FoodSelection.instance.emptySelection()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addedFood = false
        
        //foodData.append()
        
        let selection = FoodSelection.instance.selection
        food.getfood(withLocation: selection, fvc:self) { (results:([food])) in
            
            for result in results {
                print("&q=\(result)\n\n")
               // self.foodData.append(result)
                
                
            }
           // self.reloadData()
        }
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        //updateFood(location: <#T##String#>)
        self.beginTimer()
    }
    
    func beginTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkIfAdded), userInfo: nil, repeats: true)
        
    }

    
    @objc func checkIfAdded(){
        
        if (addedFood){
            self.reloadData()
            addedFood = false
        }
    }
    func addFood(data: food){
        
        foodData.append(data)
        
        addedFood = true
    }
    func reloadData(){
        
      //  super.reloadInputViews()
        self.tableView.reloadData()

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
        cell.detailTextLabel?.text = foodObject.showurl
        
        //cell.textLabel?.text = foodObject.showurl
        //cell.imageView?.image = foodObject.imageURL
        
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("Here")
        let foodObject = foodData[indexPath.row]
        
        let url = URL(string:foodObject.showurl)
        UIApplication.shared.open(url!)
        
    }


}

