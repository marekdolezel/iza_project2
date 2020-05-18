//
//  TodayTabView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI
import CoreData

// this tab shows all tasks that are stored in application

// when we use ForEach to iterate over tasks, taskItem is of type View
// I have not figured out how to get from taskItem:View to task:Task
// taskItem is only
struct TodayTabView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>
    
    var body: some View {
        // MARK: Today Tab
        NavigationView {
            Form {
                ForEach(projects, id:\.id) { project in
                    ForEach(project.taskArray, id:\.id) { taskItem in
                        NavigationLink(destination: TaskDetail(task:taskItem)) {
                                TaskRow(task: taskItem)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Today's Tasks"), displayMode: .automatic)
        }
    }
}

