//
//  Add.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/25/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//

import Foundation

class ToDoItem
{
    var title: String
    var done: Bool
    
    public init(title: String)
    {
        self.title = title
        self.done = false
    }
    
}

extension ToDoItem
{
    public class func getMockData() -> [ToDoItem]
    {
        
        return [
//ToDoItem(title: chosen)
        ]
    }
}
