//
//  Main.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 14/06/23.
//

import Foundation
final class Main: ObservableObject {
    @Published var topic = ""
    @Published var topicSelection = TopicSelection.categories
    @Published var history: [String] = []
    
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
