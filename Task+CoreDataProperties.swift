//
//  Task+CoreDataProperties.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/16/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var priority: Int32
    @NSManaged public var urgency: Bool
    @NSManaged public var dueDate: Date?
    @NSManaged public var isFinished: Bool
    @NSManaged public var origin: Project?
    
    public var wrappedName: String {
        name ?? "Unknown Task"
    }


}
