//
//  API.swift
//  FinalProj2
//
//  Created by Guadalupe Madrigal on 4/13/19.
//  Copyright © 2019 Guadalupe Madrigal. All rights reserved.
//



import UIKit

struct ApiKeys {
    static let appId = "527d6ad6"
    static let appKey = "5d9b4949450190320b6eebd0ed2fc27e"
}

struct food{
    let title: String
    let imageURL: String
    //let image: UIImage
    let showurl: String
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        
        print("------0.0")
        
        guard let title = json["label"] as? String else {throw SerializationError.missing("title is missing")}
        print("------0.1")
        let imageURL = json["image"] as! String
        //as? UIImage else {throw SerializationError.missing("Image is missing")}
        print("------0.2")
        //print("\(image)")
        guard let showurl = json["url"] as? String else {throw SerializationError.missing("URL is missing")}
        print("------0.3")
        //let url = URL(string:image)!
        
        
        self.title = title
        self.imageURL = imageURL
        self.showurl = showurl
        //self.image = UIImage()
        
        print("------\(title)")
        print("------\(showurl)")
        print("------\(imageURL)")
    }
    
    
    static let basePath = "http://api.edamam.com/search?app_id=\(ApiKeys.appId)&app_key=\(ApiKeys.appKey)"
    
    static func getfood (withLocation location:[ToDoItem], fvc:FirstViewController, completion: @escaping ([food]) -> ()) {
        
        
        var url = String(basePath)
        
        
        for todo in location{
            
            url = url +  "&q=" + todo.title.replacingOccurrences(of: " ", with: "+")
        }
        
        print("url = \(url)")
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
                        let hitsFoods = json["hits"] as! [Any]
                        
                        for i in 0..<hitsFoods.count{
                            
                            
                            print("i = \(i)")
                            if (i == 5){
                                print("I happen")
                                break
                            }
                            let recipe = hitsFoods[i] as? [String:Any]
                           // print("\(recipe)")
                            if hitsFoods != nil {
                                print("------------4")
                                if recipe != nil {
                                    print("------------5")
                                    let actualRecipe = recipe?["recipe"] as? [String:Any]
                               //     print("Actual recipe: \(actualRecipe)")
                                    let foodObject = try? food(json:actualRecipe ?? [:])
                                    //foodObject?.loadImage()
                                    if foodObject != nil{
                                        getfoodArray.append(foodObject!)
                                        fvc.addFood(data: foodObject!)
                                        print("------------6")
                                        
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
                    }
                }catch {
                    print("here")
                    print(error.localizedDescription)
                }
                completion(getfoodArray)
            }
        })
        //}
        task.resume()

    }
}



