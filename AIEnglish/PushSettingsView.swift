//
//  PushSettingsView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct PushSettingsView: View {
    var body: some View {
        
        VStack {
            NavigationView {
                NavigationLink(destination: RegistrationView()) {
                    Text("Go to reg view")
                } .navigationBarTitle("PushSettings")
            }
        }
    }
}

struct PushSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PushSettingsView()
    }
}
