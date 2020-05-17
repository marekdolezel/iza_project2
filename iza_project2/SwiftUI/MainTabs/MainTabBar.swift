//
//  ContentView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: Main TabBar of the application
struct MainTabBar: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors:[]) var projects: FetchedResults<Project>
   
    var body: some View {
        TabView {
            // Today's Tab
            TodayTabView()
                .environment(\.managedObjectContext, managedObjectContext)
                .tabItem {
                    TabBarElement(text:"Today", iconName: "clock")
                }.tag(1)

            // Projects and Tasks Tab
            ProjectsAndTasksView()
                .environment(\.managedObjectContext, managedObjectContext)
                .tabItem {
                    TabBarElement(text:"Projects and Tasks", iconName: "calendar.circle")
                }.tag(2)
        }
    }
}

struct TabBarElement: View {
    let text: String
    let iconName: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
            Text(text)
        }
    }
}
