//
//  API.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/13/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//


// part 1 https://www.youtube.com/watch?v=_c0pAz3UPEs
// part 2 https://www.youtube.com/watch?v=doqtsIsbtqs

import UIKit

struct ApiKeys {
    static let appId = "527d6ad6"
    static let appKey = "5d9b4949450190320b6eebd0ed2fc27e"
}

struct food{
    let title: String
    let image: UIImage
    let showurl: String
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        guard let title = json["label"] as? String else {throw SerializationError.missing("title is missing")}
        guard let image = json["image"] as? UIImage else {throw SerializationError.missing("Image is missing")}
        guard let url = json["url"] as? String else {throw SerializationError.missing("URL is missing")}
        
        self.title = title
        self.image = image
        self.showurl = url
        
        print("------\(title)")
        print("------\(url)")
    }
    
    static let basePath = "http://api.edamam.com/search?app_id=\(ApiKeys.appId)&app_key=\(ApiKeys.appKey)"
    
    static func getfood (withLocation location:String, completion: @escaping ([food]) -> ()) {
        let url = basePath + "&q=" + location
        //let request = URLRequest(url: URL(string: url)!)
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        print("------------0.0\(url)")
        print("------------0.1\(request)")
        
        //let task = URLSession.shared.dataTask(with: request) {(data:Data?, response:URLResponse?, error:Error?) in
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            print("------------0")
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            var getfoodArray:[food] = []
            if let data = data {
                print("------------1")
                do {
                    print("------------2")
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print("------------3")
                        let hitsFoods = json["hits"] as? [Any]
                        let recipe = hitsFoods?[0] as? [String:Any]
                       // print("\(recipe)")
                        if hitsFoods != nil {
                            print("------------4")
                            if recipe != nil {
                                print("------------5")
                              //  print("\(recipe)")
                                let actualRecipe = recipe?["recipe"] as? [String:Any]
                                print("Actual recipe: \(actualRecipe)")
                                
                                
                                    let foodObject = try? food(json:actualRecipe ?? [:])
                                    if foodObject != nil{
                                        getfoodArray.append(foodObject!)
                                    }
                               
                                    /*
                                for recipePoint in actualRecipe ?? [:] {
                                    print("------------6")
                                    
                                    
                                    
                                    if let foodObject = try? food(json:recipePoint) {
                                        print("------------7")
                                        getfoodArray.append(foodObject)
                                    }
                                }*/
                            }
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
                completion(getfoodArray)
            }
        })
        //}
        task.resume()
    }
}



