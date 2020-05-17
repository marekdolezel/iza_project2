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
        df.locale = Locale(identifier: "en_US")
        
        return df
    }
    // input to the view
    let task: Task

    var body: some View {
        HStack(alignment: .center) {
            Image("task") .resizable()
                .frame(width:40, height:40)
                       .scaledToFit()
            VStack(alignment: .leading) {
//                Text("\(project.name ?? "None")")
                Text("\(task.name ?? "None")")
                Text("\(task.dueDate!, formatter: self.dateFormatter)")
            }
            Spacer()
            Image(systemName: "star.fill")
            Image(systemName: task.urgency ? "flag.fill" : "flag")
        }
    }
}
