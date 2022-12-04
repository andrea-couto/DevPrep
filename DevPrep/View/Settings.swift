//
//  Settings.swift
//  DevPrep
//
//  Created by Andy Couto on 11/27/22.
//

import SwiftUI

struct Settings: View
{
    @AppStorage("showDescription") var showDescription = true

    var body: some View
    {
        NavigationView {
            Form {
                Toggle(isOn: $showDescription) {
                    Text("Show question descriptions")
                }
                .tint(Color("devPrepDarkGreen"))
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
