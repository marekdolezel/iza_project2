//
//  TaskDetail.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskDetail: View {
    @State var showingNewProjectSheet = false
    
    // input to TaskDetail
    var task: Task

    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Name").bold()
                Text("\(task.name!)")
            }
            VStack(alignment: .leading) {
                Text("Description").bold()
                Text("\(task.desc!)")
            }
            VStack(alignment: .leading) {
                Text("Due").bold()
                Text("\(task.dueDate!)")
            }
            VStack(alignment: .leading) {
                Text("Priority").bold()
                Text("\(task.priority)")
            }
            VStack(alignment: .leading) {
                Text("Urgency").bold()
                HStack {
                    Text(task.urgency ? "Urgent": "Not urgent")
                    Spacer()
                    Image(systemName: task.urgency ? "flag.fill" : "flag")
                }
            }
            VStack(alignment: .leading) {
                Text("Finished?").bold()
                Text(task.isFinished ? "Yes" : "No")
            }
            
            NavigationLink(destination: ProjectDetail(project:task.origin!)) {
                     VStack(alignment: .leading) {
                        Text("In project").bold()
                        Text("\(task.origin!.name!)")
                                   }
            }
        }
            .navigationBarTitle(Text("Task Detail"), displayMode: .automatic)
            .navigationBarItems(trailing: Button(action: {}) { Text("Edit").bold() })
    }
}
