//
//  TaskListItem.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    let project: Project
    
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 5.0)
            VStack(alignment: .leading) {
                Text("\(project.name)")
                Text("\(task.name)")
                Text("23.2.2019")
            }
            Image(systemName: "star.fill")
            Image(systemName: "flag")
        }
    }
}

struct TaskListItem_Previews: PreviewProvider {
    static var previews: some View {
        let taskExample = Task(name: "research of microbiology", description: "dsc", priority: 1, urgency: true, dueDate: Date(), isFinished: true)
        let projectExample = Project(name: "IMS", description: "simulation study", color: Color.red, priority: 1, urgency: true, dueDate: Date(), isFinished: true )
        return TaskRow(task: taskExample, project: projectExample )
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
