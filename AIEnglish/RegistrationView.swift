//
//  RegistrationView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AIView()) {
                Text("Go to main view")
            } .navigationBarTitle("Registration")
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
