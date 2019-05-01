//
//  Last.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/30/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import UIKit

class Middle: UIViewController{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
        
        if FoodSelection.instance.selection.count == 0 {
            
            let alertController = UIAlertController(title: "Final List is Empty", message:
                "Please select food items", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }
        
        
        
    }
    
    
}




