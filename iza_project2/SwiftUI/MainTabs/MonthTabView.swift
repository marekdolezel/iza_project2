//
//  MonthTabView.swift
//  iza_project2
//
//  Created by Marek Dolezel on 5/14/20.
//  Copyright © 2020 Marek Dolezel. All rights reserved.
//

import SwiftUI

struct MonthTabView: View {
//    let goal: LocalizedStringKey = "english is now"

    var body: some View {

        Text("thisIsTrs")
    }
}

struct MonthTabView_Previews: PreviewProvider {
    static var previews: some View {
        MonthTabView().environment(\.locale, .init(identifier: "cs"))
    }
}
