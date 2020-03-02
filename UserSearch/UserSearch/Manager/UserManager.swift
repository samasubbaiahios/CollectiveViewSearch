//
//  UserManager.swift
//  UserSearch
//
//  Created by Test User on 10/08/19.
//  Copyright © 2019 Task. All rights reserved.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    private init() { }
    
    func fetchUser(_ completionHandler: (([User]?) -> Void))  {
        guard let filePath = Bundle.main.path(forResource: "Users", ofType: "json") else {
           completionHandler(nil)
           return
        }
        
        do {
            let url = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            completionHandler(users)
        } catch {
            debugPrint(" Error in parsing Json ")
            completionHandler(nil)
        }
    }
}
