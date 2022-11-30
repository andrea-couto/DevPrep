//
//  BottomNav.swift
//  DevPrep
//
//  Created by Andy Couto on 11/27/22.
//

import SwiftUI

struct BottomNav: View {
    var body: some View {
        TabView {
            QuestionListView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Questions")
            }
            Settings()
                .tabItem {
                    Image(systemName: "gear.circle.fill")
                    Text("Settings")
            }
        }
    }
}

struct BottomNav_Previews: PreviewProvider {
    static var previews: some View {
        BottomNav()
    }
}
