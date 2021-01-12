//
//  UserController.swift
//  MyChurch
//
//  Created by Wei Xu on 2021-01-12.
//

import Foundation
import CoreData
import UIKit

class UserController {
    private var moc : NSManagedObjectContext
    
    init() {
        self.moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func checkUser(username : String, password : String) -> Int {
        
        let request : NSFetchRequest<User> = User.fetchRequest()

        let query = NSPredicate(format: "userName == %@ && password == %@", username, password)

        request.predicate = query
        
        do {
           let results = try moc.fetch(request)
           return results.count
 
        } catch {
                print(#function, "Something went wrong. User Fetch failed.")
        }
        
        return 0
    }
    
    func createUser(username : String, password : String, telephone : String, name : String, email : String) -> UserStatus {
        
        let user = User(context:moc)
        user.userName=username
        user.password=password
        user.telephoneNo=telephone
        user.name=name
        user.email=email
        
        // save user to the database
        do {
            try moc.save()
            
            print(#function, "User successfully created")
            return UserStatus.INSERT_SUCCESS
        }
        catch let error as NSError {
            print(#function, "Something Went wromng. Couldn't create user")
            print(#function, error.localizedDescription)
            return UserStatus.INSERT_FAILURE
        }
    }
    
    enum UserStatus{
        case INSERT_SUCCESS
        case USER_EXITS
        case INSERT_FAILURE
    }
}
