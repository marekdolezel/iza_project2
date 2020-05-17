//
//  Project.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/16/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import Foundation

extension Project: Identifiable {
    var tasksArray: [Task] {
        let set = tasks as? Set<Task> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

    
}
