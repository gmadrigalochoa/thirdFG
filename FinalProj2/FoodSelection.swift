//
//  FoodSelection.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/28/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import Foundation


class FoodSelection{
    
    
    
    
    var selection: [ToDoItem] = []
    init(){
        self.selection = []
        self.fl = FinalList()
        
    }
    static var instance = FoodSelection()
    var fl : FinalList
    
    
    func setFinalListController( fl : FinalList){
        
        self.fl = fl
    }

    
    func addToSelection(add: ToDoItem){
        
        selection.append(add)
        
        fl.tableView.reloadData()
    }
    //FoodSelection.instance.emptySelection()
    func emptySelection(){
        
        selection.removeAll()
    }
    
}
