//
//  MainView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 11/06/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var main = Main()
    
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Choose the topic")
                
                HStack(){
                    TextField("What do you want to talk about?", text: $main.topic)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Send") {
                        if main.topic.isEmpty {
                            
                        } else {
                            if main.history.contains(main.topic) == false {
                                main.history.append(main.topic)
                            }
                            
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(main.topic.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty)
                
                }
                
                Picker("Provider", selection: $main.topicSelection) {
                    ForEach(Main.TopicSelection.allCases) {
                        Text($0.text).id($0)
                    }
                }
                #if !os(watchOS)
                .pickerStyle(.segmented)
                #endif
                
                switch main.topicSelection {
                case .categories:
                    CategoryView(topic: $main.topic).padding(.leading, 8)
                case .history:
                    HistoryView(history: main.history)
                }
                GeneratedWordsView(generatedWords: [])
                SentencesView()
            }
        }
    }
    

}
    
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
