//
//  TaskListItemContextMenu.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct TaskRowContextMenu: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                HStack {
                    Text("Mark as done")
                    Image(systemName: "star")
                }
            }
            Button(action: {}) {
                HStack {
                    Text("Pick this task")
                    Image(systemName: "star")
                }
            }
            
        }
    }
}

struct TaskListItemContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowContextMenu()
    }
}
