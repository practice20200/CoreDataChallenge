//
//  Note.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import CoreData

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deltedDate: Date?
}
