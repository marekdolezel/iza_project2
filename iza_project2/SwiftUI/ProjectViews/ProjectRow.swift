//
//  ProjectRow.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/15/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import Foundation
import SwiftUI

struct ProjectRow: View {
    var project: Project
    
    var body: some View {
        HStack(alignment: .center) {
            Image("project") .resizable()
            .frame(width:40, height:40)
                   .scaledToFit()
            Rectangle()
                .fill(project.urgency ? Color.red : Color.gray)
                .frame(width: 5.0)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Project name").bold()
                    Text(project.name!)
                }
                Text("23.2.2019")
            }
            Spacer()
            Image(systemName: "star.fill")
            Image(systemName: project.urgency ? "flag.fill" : "flag")
        }
    }
}

//struct ProjectRow_Previews: PreviewProvider {
//    static var previews: some View {
//        let projectExample = Project(tasks: [Task](), name: "IMS", description: "simulation study", color: Color.red, priority: 1, urgency: true, dueDate: Date(), isFinished: true )
//        return ProjectRow(project: projectExample)
//            .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
