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
            TodayTabView().tabItem {
                TabBarElement(text:"Today", iconName: "clock").environment(\.locale, .init(identifier: "cs"))
            }.tag(1)

            // Week Tab
            WeekTabView()
                .environment(\.managedObjectContext, managedObjectContext)
                .tabItem {
                TabBarElement(text:"This Week", iconName: "7.circle")
            }.tag(2)

            // Month Tab
            MonthTabView().tabItem {
                TabBarElement(text:"This Month", iconName: "calendar.circle")
            }.tag(3)

            // Projects and Tasks Tab
            ProjectsAndTasksView()
                .environment(\.managedObjectContext, managedObjectContext)
                .tabItem {
                TabBarElement(text:"Projects and Tasks", iconName: "calendar.circle")
            }.tag(4)
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
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//         MainTabBar()
//    }
//}
