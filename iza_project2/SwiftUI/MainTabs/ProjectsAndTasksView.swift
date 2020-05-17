//
//  ProjectsAndTasksView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI
import CoreData
struct ProjectsAndTasksView: View {
//    @Binding var st: DataModel
     @Environment(\.managedObjectContext) var managedObjectContext
        @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>
//        @FetchRequest(entity: Task.entity(), sortDescriptors:[]) var tasks: FetchedResults<Task>
    @State var selectorIndex = 0
    @State var PickerOptions = ["Projects","Tasks"]

    @State var showingNewTaskSheet       = false
    @State var showingNewProjectSheet    = false
    
//    @State var projects = store.getProjects()
//    @State var haveProjects = store.haveProjects()

    var body: some View {
        NavigationView {
                    VStack {
                        Picker("", selection: $selectorIndex) {
                            ForEach(0 ..< PickerOptions.count) { index in
                                Text(self.PickerOptions[index]).tag(index)
                            }
                        }
                            .pickerStyle(SegmentedPickerStyle())
                        HStack {
                                // Botton at the top of a screen for 'New Project'
                            Button(action: {
                                    self.showingNewProjectSheet.toggle()
                                }
                            ) { Text(selectorIndex == 0 ? "New Project" : "New Task") }
                                    .sheet(isPresented: self.$showingNewProjectSheet) {
                                        NewProjectOrTaskSheet(showingThisSheet: self.$showingNewProjectSheet, showingProjectTorTaskF: self.selectorIndex==0 ? true : false, projectItem: nil)
                                            .environment(\.managedObjectContext, self.managedObjectContext)
                                    }
                        }
                        Spacer()
                        // comment here to stop crashing,  projects.isEmpty je True
                        if selectorIndex == 0 {
                            if !projects.isEmpty {
                                Form {
                                    ForEach(projects, id:\.id) { projectItem in
                                        NavigationLink(destination: ProjectDetail(project: projectItem)) {
                                            ProjectRow(project: projectItem)
                                        }
                                    }
                                }
                            }
                            else {
                                ProjectsAndTasksEmptySubView(selectorIndex: selectorIndex)
                            }
                        } else {
                            if !projects.isEmpty {

                                // problem here
                                Form {
                                    ForEach(projects, id:\.id) { projectItem in
                                        Section(header:
                                            HStack {
                                                Rectangle()
//                                                    .fill(projectItem.color)
                                                    .frame(width: 5.0)
                                                HStack(alignment: .center) {
                                                    Text("Project name").bold()
                                                    Text(projectItem.name!)
                                                }
                                        }) {
                                            if !projectItem.taskArray.isEmpty {
                                                ForEach(projectItem.taskArray, id:\.id) { taskItem in
                                                    TaskRow(task: taskItem)
                                                }
                                            }
                                            else {
                                                VStack(alignment: .leading) {
                                                    Text("\(projectItem.name!) project has no tasks")
                                                    Button(action: {
                                                        self.showingNewProjectSheet.toggle()
                                                    }) { Text("Create new task").foregroundColor(Color.blue)}
                                                        .sheet(isPresented: self.$showingNewProjectSheet) {
                                                            NewProjectOrTaskSheet(showingThisSheet: self.$showingNewProjectSheet, showingProjectTorTaskF: self.selectorIndex==0 ? true : false, projectItem: projectItem)
                                                            .environment(\.managedObjectContext, self.managedObjectContext)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                // end problem here

                            } else {
                                ProjectsAndTasksEmptySubView(selectorIndex: selectorIndex)
                            }

                        }
                        // end: comment here to stop crashing
                    }
                    .navigationBarTitle("Projects and Tasks", displayMode: .inline)
        }
    }
                  
}

struct ProjectsAndTasksEmptySubView: View {
    @State var selectorIndex: Int

    var body: some View {
        VStack {
            Spacer()
            Text(selectorIndex == 0 ? "No projects" : "No tasks")
                .foregroundColor(Color.gray)
            Spacer()
        }.scaledToFill()
    }
}
func generateProject(_ context: NSManagedObjectContext) -> Project {
    let project = Project(context: context)
    project.id = UUID()
    project.name = UUID().uuidString
    project.urgency = true
    project.desc = UUID().uuidString
    project.dueDate = Date()
    project.isFinished = false
    return project
}
//struct ProjectsAndTasksView_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        var projects = [Project]()
//        for _ in 1...10 {
//            projects.append(generateProject(context))
//        }
////                 DetailView(event: newEvent).environment(\.managedObjectContext, context)
//
//            return ProjectsAndTasksView(projects: projects).environment(\.managedObjectContext, context)
//    }
//}
