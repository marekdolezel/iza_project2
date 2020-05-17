//
//  taskFilter.swift
//  Tasker
//
//  Created by Marek Dolezel on 5/17/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import Foundation

func displayInTodayTab(input task:Task) -> Bool {
    
    let nextDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
    return task.dueDate! < nextDate! ? true : false
}
