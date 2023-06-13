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
    @State var history: [String] = []
    
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Choose the topic")
                
                HStack(){
                    TextField("What do you want to talk about?", text: $topic)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Send") {
                        if topic.isEmpty {
                            
                        } else {
                            if history.contains(topic) == false {
                                history.append(topic)
                            }
                            
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(topic.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty)
                
                }
                
                Picker("Provider", selection: $topicSelection) {
                    ForEach(TopicSelection.allCases) {
                        Text($0.text).id($0)
                    }
                }
                #if !os(watchOS)
                .pickerStyle(.segmented)
                #endif
                
                switch topicSelection {
                case .categories:
                    CategoryView(topic: $topic).padding(.leading, 8)
                case .history:
                    HistoryView(history: history)
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
