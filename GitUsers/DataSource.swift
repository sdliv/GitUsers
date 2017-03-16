//
//  DataSource.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import Foundation
import UIKit


let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

func getUser(userName:String, completionHandler:@escaping (_ json:[String:Any]) -> ()) {
    
    let url = URL(string: "https://api.github.com/users/\(userName)")
    let task = session.dataTask(with: url!) { (data, response, error) in
        if error != nil {
            print(error!.localizedDescription)
        } else {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
    
                    completionHandler(json)
                    
                }
            } catch {
                print("error in JSONSerialization")
            }
        }
    }
    task.resume()
}

func getFollowers(userName:String) {
    let url = URL(string: "https://api.github.com/users/\(userName)/followers")
    let task = session.dataTask(with: url!) { (data, response, error) in
        if error != nil {
            print(error!.localizedDescription)
        } else {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
                    let followers:[GitUser] = [GitUser]()
                }
            } catch {
                print("error in JSONSerialization")
            }
        }
    }
    task.resume()
}

extension UIImageView {
    public func imageFromURL(urlString: String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async(execute: {() -> Void in
                let image = UIImage(data:data!)
                self.image = image
            })
        }.resume()
    }
}
