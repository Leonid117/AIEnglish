//
//  ContentView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Words")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Settings")
                }
            ConversationView()
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("Conversation")
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
