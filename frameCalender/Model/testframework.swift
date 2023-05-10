//
//  testframework.swift
//  frameCalender
//
//  Created by Navdeep Singh on 09/05/23.
//


import Foundation

public class TestframeWork {
    public init() {
        
    }
    
    public func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("Error")
                return
            }
            
            var user: Users?
            do {
                user = try JSONDecoder().decode(Users.self, from: data)
            } catch  {
                print("failed to convert")
            }
            
            print(user?.id)
            
        })
        task.resume()
    }
    
    public func fetchData() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        getData(from: url)
    }

    public func printVersion() {
        print("my first sdk function")
    }
        
}

struct Users: Codable {
    let userID, id: Int
    let title, body: String
}
