//
//  AIView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct AIView: View {
    @State private var searchText = ""
    let phrases = [
        "123",
        "456",
        "789",
    ]
    var body: some View {
        
        NavigationView {
            VStack {
                List(phrases, id: \.self) { phrase in
                    NavigationLink {
                        Text(phrase)
                    } label: {
                        Text(phrase)
                    }
                }
                NavigationLink(destination: PushSettingsView()) {
                    Text("Go to settings")
                } .navigationBarTitle("AIview")
            }
        }
        .searchable(text: $searchText)  
    }
}

struct AIView_Previews: PreviewProvider {
    static var previews: some View {
        AIView()
    }
}
