//
//  TaskListItem.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
   var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MM/dd/YYYY"
        return df
    }
    
    // input to the view
    var task: Task

    var body: some View {
        HStack(alignment: .center) {
            Image("task") .resizable()
                .frame(width:40, height:40)
                       .scaledToFit()
            VStack(alignment: .leading) {
                Text("\(task.name ?? "None")")
                Text("\(task.dueDate!, formatter: self.dateFormatter)")
            }
            Spacer()
            Image(systemName: task.isFinished ? "checkmark" : "clear")
            Image(systemName: task.urgency ? "flag.fill" : "flag")
        }
        .contextMenu {
            TaskRowContextMenu(task: task)
//            VStack {
//                Button(action: {
//                    self.task.isFinished = true
//                }) {
//                    HStack {
//                        Text("Mark as done")
//                        Image(systemName: "star")
//                    }
//                }
//            }
        }
    }
}
