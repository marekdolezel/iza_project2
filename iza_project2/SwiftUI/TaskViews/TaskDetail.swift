//
//  TaskDetail.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskDetail: View {
    var task: Task
    @State var showingNewProjectSheet = false

    var body: some View {
        NavigationView {
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
            }

            .navigationBarTitle(Text("Task Detail"), displayMode: .automatic)
            .navigationBarItems(trailing: Button(action: {}) { Text("Edit").bold() })
        }
    }
}

//struct TaskDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        let taskExample = Task(name: "research of microbiology", description: "dsc", priority: 1, urgency: true, dueDate: Date(), isFinished: true)
//
//        return TaskDetail(task: taskExample)
//    }
//}
