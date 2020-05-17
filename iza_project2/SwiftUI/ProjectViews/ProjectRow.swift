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
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        
        return df
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Image("project") .resizable()
            .frame(width:40, height:40)
                   .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(project.name!)
                Text("\(project.dueDate!)")
            }
            Spacer()
            Image(systemName: "star.fill")
            Image(systemName: project.urgency ? "flag.fill" : "flag")
        }
        .contextMenu {
            VStack {
                Button(action: {
                    self.project.isFinished = true
                    
                }) {
                    HStack {
                        Text("Mark as done")
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}


