//
//  SettingsView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("Send notification in 5 sec") {
                notify.sendNotification(date: Date(),
                                        type: "time",
                                        timeInterval: 5,
                                        title: "Hey",
                                        body: "Some text here")
            }
            Spacer()
            Button("Request permissions") {
                notify.askPermission()
            }
        }
        
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
