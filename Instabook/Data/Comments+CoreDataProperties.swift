//
//  Comments+CoreDataProperties.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//
//

import Foundation
import CoreData


extension Comments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comments> {
        return NSFetchRequest<Comments>(entityName: "Comments")
    }

    @NSManaged public var userID: Int16
    @NSManaged public var comment: String?
    @NSManaged public var likes: Int16
    @NSManaged public var ueerName: String?

}
