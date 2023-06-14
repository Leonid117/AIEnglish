//
//  APITestView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 13/06/23.
//

import SwiftUI

struct API {
    func getWords() async throws -> [String] {
        let url = URL(string: "https://run.mocky.io/v3/2dd8c653-f6ac-4cf3-adb2-bcaf0459c510")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let answer = try JSONDecoder().decode(ResponseData.self, from: data).answer
        return try await words(fromAnswer: answer)
    }
    
    private func words(fromAnswer answer: String) async throws -> [String] {
        let pattern = "<li>(.*?)</li>"
        let regex = try NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: answer, range: NSRange(answer.startIndex..., in: answer))
        
        let elements = matches.map { match -> String in
            let range = Range(match.range(at: 1), in: answer)!
            return String(answer[range])
        }
        
        return elements
        
    }
}

#warning("move")

struct ResponseData: Codable {
    var answer: String
}

