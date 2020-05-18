//
//  ProjectRow.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/15/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import Foundation
import SwiftUI

struct ProjectRow: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MM/dd/YYYY"
        return df
    }
    
    // input for ProjectRow
    var project: Project

    var body: some View {
        // MARK: Project Row
        HStack(alignment: .center) {
            Image("project") .resizable()
            .frame(width:40, height:40)
                   .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(project.name!)
                Text("\(project.dueDate!, formatter: dateFormatter)")
            }
            Spacer()
            Image(systemName: project.isFinished ? "checkmark" : "clear")
            Image(systemName: project.urgency ? "flag.fill" : "flag")
        }
        .contextMenu {
            VStack {
                Button(action: {
                    self.project.isFinished = true
                }) {
                    HStack {
                        Text("Mark as done")
                        Image(systemName: "star")
                    }
                }
                
                Button(action: {
                    for task in self.project.taskArray {
                        task.origin!.removeFromTasks(task)
                        self.managedObjectContext.delete(task)
                    }
                    self.managedObjectContext.delete(self.project)
               }) {
                   HStack {
                       Text("Delete project and its tasks")
                       Image(systemName: "delete.left")
                   }
               }
            }
        }
    }
}


