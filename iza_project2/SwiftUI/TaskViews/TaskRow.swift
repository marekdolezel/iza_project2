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
//    let project: Project
    
    var body: some View {
        HStack(alignment: .center) {
            Image("task") .resizable()
                .frame(width:40, height:40)
                       .scaledToFit()
            Rectangle()
//                .fill(project.color)
                .frame(width: 5.0)
            VStack(alignment: .leading) {
//                Text("\(project.name ?? "None")")
                Text("\(task.name ?? "None")")
                Text("23.2.2019")
            }
            Image(systemName: "star.fill")
            Image(systemName: task.urgency ? "flag.fill" : "flag")
        }
    }
}

//struct TaskRow_Previews: PreviewProvider {
//    static var previews: some View {
////        let taskExample = Task(name: "research of microbiology", description: "dsc", priority: 1, urgency: true, dueDate: Date(), isFinished: true)
////        let projectExample = Project(name: "IMS", description: "simulation study", color: Color.green, priority: 1, urgency: true, dueDate: Date(), isFinished: true )
//        return TaskRow( )
//            .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
