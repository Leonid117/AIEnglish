//
//  CategoryView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 12/06/23.
//

import SwiftUI

struct GeneratedWords: Identifiable {
    var name: String
    var icon: String
    var isFavorite: Bool
    let id = UUID()

    
    static func preview() -> [GeneratedWords] {
        return [GeneratedWords(name: "Apple", icon: "🍎", isFavorite: true),
                GeneratedWords(name: "Banana", icon: "🍌", isFavorite: false),
                GeneratedWords(name: "Cherry", icon: "🍒", isFavorite: false),
                GeneratedWords(name: "Mango", icon: "🥭", isFavorite: true),
                GeneratedWords(name: "Kiwi", icon: "🥝", isFavorite: false),
                GeneratedWords(name: "Strawberry", icon: "🍓", isFavorite: false),
                GeneratedWords(name: "Graps", icon: "🍇", isFavorite: true)
        ]
    }
}


struct CategoryView: View {
     
    @Binding var topic: String
    private let categories = GeneratedWords.preview()
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 10, alignment: .leading),
        GridItem(.adaptive(minimum: 100), spacing: 10, alignment: .leading)
    ]

    var body: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders, .sectionFooters]
        ) {
            Section() {
                ForEach(categories) { category in
                    Button {
                        topic = category.name
                    } label: {
                        HStack {
                            Text(category.icon)
                            Text(category.name)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(topic: .constant(""))
    }
}
