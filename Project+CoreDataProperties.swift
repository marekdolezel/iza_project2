//
//  Project+CoreDataProperties.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/16/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var priority: Int32
    @NSManaged public var urgency: Bool
    @NSManaged public var dueDate: Date?
    @NSManaged public var isFinished: Bool
    @NSManaged public var tasks: NSSet?
    
    public var taskArray: [Task] {
        let set = tasks as? Set<Task> ?? []
        return Array(set)
    }

}

// MARK: Generated accessors for tasks
extension Project {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}
