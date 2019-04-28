//
//  Books+CoreDataProperties.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//
//

import Foundation
import CoreData


extension Books {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Books> {
        return NSFetchRequest<Books>(entityName: "Books")
    }

    @NSManaged public var bookID: Int16
    @NSManaged public var bookTitle: String?
    @NSManaged public var bookSummary: String?
    @NSManaged public var bookRating: Float
    @NSManaged public var bookAuthor: String?

}
