//
//  SentencesView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 13/06/23.
//

import SwiftUI

struct SentencesView: View {
    var body: some View {
        LazyVStack {
            Text("Let's learn them!")
            LazyHStack {
                LazyVStack() {
                    Text("Apples and bananas grow on trees")
                    Text("Яблоки и бананы растут на деревьях")
                        .font(.caption).foregroundColor(Color.blue)
                }
                
                Divider()
                
                LazyVStack(alignment: .trailing) {
                    Text("Apple").font(.caption)
                    Text("Banana").font(.caption)
                }
                .foregroundColor(Color.green)
                .frame(minWidth: 50)
            }
            Button("Next") {
                
            }
        }
    }
}

struct SentencesView_Previews: PreviewProvider {
    static var previews: some View {
        SentencesView()
    }
}
