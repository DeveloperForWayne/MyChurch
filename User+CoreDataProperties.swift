//
//  User+CoreDataProperties.swift
//  MyChurch
//
//  Created by Wei Xu on 2020-11-11.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var password: String?
    @NSManaged public var telephoneNo: String?
    @NSManaged public var name: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
