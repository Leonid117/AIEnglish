//
//  Main.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 14/06/23.
//

import Foundation

@MainActor
final class Main: ObservableObject {
    private let api = API()
    @Published var topic = "" {
        didSet {
            Task {
                do {
                    generatedWords = try await api.getWords()
                } catch {
                    self.error = error
                }
            }
        }
    }
    
    @Published var error: Error?
    @Published var topicSelection = TopicSelection.categories
    @Published var history: [String] = []
    @Published var generatedWords: [String] = []
    
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
