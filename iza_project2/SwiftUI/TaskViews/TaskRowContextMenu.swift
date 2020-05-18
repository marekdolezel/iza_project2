//
//  TaskListItemContextMenu.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskRowContextMenu: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Task.entity(), sortDescriptors:[]) var tasks: FetchedResults<Task>

    var task: Task
    
    var body: some View {
        VStack {
            Button(action: {
                self.task.isFinished = true
            }) {
                HStack {
                    Text("Mark as done")
                    Image(systemName: "checkmark.circle")
                }
            }
            
            Button(action: {
                self.task.origin!.removeFromTasks(self.task)
                self.managedObjectContext.delete(self.task)
            }) {
                HStack {
                    Text("Delete task")
                    Image(systemName: "delete.left")
                }
            }
            
            
        }
    }
}
