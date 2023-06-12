//
//  WordsView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct WordsView: View {
    
    @State private var topic = ""
    @State var topicSelection = TopicSelection.categories
    
    var body: some View {
        
        ScrollView {
            LazyVStack{
                Text("Choose the topic")
                
                LazyHStack(){
                    TextField("What do you want to talk about?", text: $topic)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Send") {
                    }
                    .buttonStyle(.borderedProminent)
                
                }
                
                Section() {
                    Picker("Provider", selection: $topicSelection) {
                        ForEach(TopicSelection.allCases) {
                            Text($0.text).id($0)
                        }
                    }
                    #if !os(watchOS)
                    .pickerStyle(.segmented)
                    #endif
                }
                
                Section() {
                    switch topicSelection {
                    case .categories:
                        CategoryView().padding(.leading, 8)
                    case .history:
                        Text("321")
                        Text("321")
                        Text("321")
                        Text("321")
                    }
                }
                GeneratedWordsView()
                SentencesView()
            }
        }
    }
    
    enum TopicSelection: Identifiable, CaseIterable {
        
        case categories
        case history
        
        var id: Self { self }
        
        var text: String {
            switch self {
            case .categories:
                return "Categories"
            case .history:
                return "History"
            }
        }
    }
}
    
struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
