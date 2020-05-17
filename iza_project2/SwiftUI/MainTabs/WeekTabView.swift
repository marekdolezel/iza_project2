//
//  WeekTabView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct WeekTabView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>

    var body: some View {
        VStack {
            if !projects.isEmpty {
                ForEach(projects, id:\.self) { project in
                    Text(project.name!)
                }
            }
            else {
                Text("projects are empty")
            }
        }
//        Text("Random")
    }
}

//struct WeekTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeekTabView()
//    }
//}
