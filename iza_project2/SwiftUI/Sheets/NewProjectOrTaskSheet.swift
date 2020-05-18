//
//  NewProjectSheet.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

// Please note that,
// TODO: picker for importance
// TODO: add a task

import SwiftUI
import CoreData

struct NewProjectOrTaskSheet: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>

    @State var name = ""
    @State var desc = ""
    @State var dueDate = Date()
    @State var urgency = false
    @State var taskOrigin: Task?
    @State var projectSelection: Project?

    struct ProjectPickerItem {
        let project: Project?
    }

    // MARK: passed arguments to this View
    @Binding var showingThisSheet: Bool
    var showingProjectTorTaskF: Bool
    @State var projectItem: Project?
    
    // check if the user entered all the required information
    //      Project: name, description
    //      Task: name, description, and project associated with this task
    var finishedEditing: Bool {
        if showingProjectTorTaskF == true {
            // check required info for project
            if name == "" || desc == "" {
                return false
            }
        } else {
            // check required info for task
            if name == "" || desc == "" || (projectSelection == nil && projectItem == nil) {
                return false
            }
        }
        
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text:$name)
                    TextField("Description", text:$desc)
                    DatePicker("Due", selection: $dueDate, displayedComponents: .date)
                    HStack {
                        Text("Urgency")
                        Spacer()
                        Button(action: {self.urgency.toggle()}) {Image(systemName: urgency ? "flag.fill" : "flag")}
                    }
                    if projectItem == nil {
                        if showingProjectTorTaskF == false {
                            Picker("Project", selection: $projectSelection) {
                                ForEach(projects.map(ProjectPickerItem.init), id: \.project) {
                                    Text("\($0.project?.name ?? "None")")
                                }
                            }
                        }
                    }
                }
            }
                
            .navigationBarTitle(Text(showingProjectTorTaskF ? "New Project": "New Task"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {self.showingThisSheet = false}) {Text("Cancel")},
                trailing: Button(action: {
                    // When the user fills in all the required information, swiftui stores that information into @State variables
                    
                    if self.showingProjectTorTaskF == true {
                        // all the required information for project was filled in and the user clicked the 'add' button
                        let project = Project(context: self.managedObjectContext)
                        project.id = UUID()
                        project.name = self.name
                        project.urgency = self.urgency
                        project.desc = self.desc
                        project.dueDate = self.dueDate
                        project.isFinished = false
                        project.priority = 0

                        try? self.managedObjectContext.save()
                    } else {
                        // all the required information for a task was filled in and the user clicked the 'add' button
                        let task = Task(context: self.managedObjectContext)
                        task.id = UUID()
                        task.name = self.name
                        task.urgency = self.urgency
                        task.desc = self.desc
                        task.dueDate = self.dueDate
                        task.isFinished = false
                        task.priority = 0
                        
                        // if we got to this sheet from a project, then projectItem contains reference to that project. Therefore we can
                        // link newly created task with existing project (task.origin), and add that task to project
                        // otherwise
                        if let _project = self.projectItem {
                            task.origin = _project
                            _project.addToTasks(task)
                        } else {
                            task.origin = self.projectSelection
                            self.projectSelection?.addToTasks(task)
                        }
                    }
                    self.showingThisSheet = false
                }) {Text("Add").bold()}.disabled(!finishedEditing)
            )
        }
    }
}
