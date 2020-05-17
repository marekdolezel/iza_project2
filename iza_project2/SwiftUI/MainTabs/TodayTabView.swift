//
//  TodayTabView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TodayTabView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>
    @FetchRequest(entity: Task.entity(), sortDescriptors:[]) var tasks: FetchedResults<Task>
    
  

    var body: some View {
        NavigationView {
//            NavigationLink(destination: NewProjectSheet()) {
//                Text("New project")
//            }
                
                  
            Form {
                ForEach(projects, id:\.id) { project in
                    ForEach(project.taskArray, id:\.id) { taskItem in
//                        if displayInTodayTab(input: taskItem) == true {
                        NavigationLink(destination: TaskDetail(task:taskItem)) {
                                TaskRow(task: taskItem)
                        }
//                        }
                    }
                }
            }
            .navigationBarTitle(Text("Today's Tasks"), displayMode: .automatic)
        }
    }
}

//struct TodayTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayTabView()
//    }
//}
