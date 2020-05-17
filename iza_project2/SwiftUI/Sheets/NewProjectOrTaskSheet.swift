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
    
    var finishedEditing: Bool {
        if showingProjectTorTaskF == true {
            if name == "" || desc == "" {
                return false
            }
        } else {
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
//                        Picker("Project", selection: $projectSelection) {
//                            ForEach(projects, id:\.id) {project in
//                                Text(project.name!).tag(project)
//                            }
//
//                        }
                        if showingProjectTorTaskF == false {
                            Picker("Project", selection: $projectSelection) {
                                ForEach(projects.map(ProjectPickerItem.init), id: \.project) {
                                    Text("\($0.project?.name ?? "None")")
                                }
                            }
                        }

                        Text("there will be a picker, we have not passed project")
                    }
                }
            }
                
            .navigationBarTitle(Text(showingProjectTorTaskF ? "New Project": "New Task"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {self.showingThisSheet = false}) {Text("Cancel")},
                trailing: Button(action: {
                    // this is an Add button in sheet
                    
                    // When the user fills in all the required information, swiftui stores that information into @State variables
                    
                    // the code below stores the entered information to CoreData
                    if self.showingProjectTorTaskF == true {
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
                        let task = Task(context: self.managedObjectContext)
                        task.id = UUID()
                        task.name = self.name
                        task.urgency = self.urgency
                        task.desc = self.desc
                        task.dueDate = self.dueDate
                        task.isFinished = false
                        task.priority = 0
                        
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

//struct NewProjectSheet_Previews: PreviewProvider {
////    @Binding var bind: Bool
//
//    static var previews: some View {
//        return NewProjectSheet(showingThisSheet: Binding.constant(false))
//    }
//}

//struct NewProjectSheet_Previews: PreviewProvider {
//    
//    @State var showingThisSheet = true
//    static var previews: some View {
//        NewProjectSheet(showingThisSheet: $showingThisSheet)
//    }
//}
