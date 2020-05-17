//
//  ProjectDetail.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/15/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct ProjectDetail: View {
    @Environment(\.managedObjectContext) var managedObjectContext
       @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>

    var project: Project
    let goal: LocalizedStringKey = "goal"
    @State var showingNewProjectSheet = false
    var body: some View {
//        @NSManaged public var tasks: NSSet?

        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    Text("Name").bold()
                    Text("\(project.name!)")
                }
                VStack(alignment: .leading) {
                    Text("Description").bold()
                    Text("\(project.desc!)")
                }
                VStack(alignment: .leading) {
                    Text("Due").bold()
                    Text("\(project.dueDate!)")
                }
                VStack(alignment: .leading) {
                    Text("Priority").bold()
                    Text("\(project.priority)")
                }
                VStack(alignment: .leading) {
                    Text("Urgency").bold()
                    HStack {
                        Text(project.urgency ? "Urgent": "Not urgent")
                        Spacer()
                        Image(systemName: project.urgency ? "flag.fill" : "flag")
                    }
                }
                VStack(alignment: .leading) {
                    Text("Is Finished?").bold()
                    Text( project.isFinished ? "Yes" : "No")
                }
                Button(action: {
                        self.showingNewProjectSheet.toggle()
                    }
                ) { Text("Add new task") }
                    .sheet(isPresented: self.$showingNewProjectSheet) {
                        NewProjectOrTaskSheet(showingThisSheet: self.$showingNewProjectSheet, showingProjectTorTaskF: false, projectItem: self.project)
                        .environment(\.managedObjectContext, self.managedObjectContext)
                }
            }
        .navigationBarTitle(Text("Project Detail"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {}) { Text("Edit").bold() })
        }
    }
}

//struct ProjectDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        return ProjectDetail(project: projectExample).environment(\.managedObjectContext, context)
//
//        return ProjectDetail(project: projectExample)
//    }
//}
