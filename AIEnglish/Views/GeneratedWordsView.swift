//
//  GeneratedWordsView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 12/06/23.
//

import SwiftUI


struct GeneratedWordsView: View {

    @State var words = ["Apple", "Banana", "Restart", "Fade", "Restore", "Sun", "Crate", "Feel", "Down", "Top"]
    @State var selectedWords: Set<String> = []
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 10, alignment: .leading),
        GridItem(.adaptive(minimum: 100), spacing: 10, alignment: .leading)
        ]
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Choose the words you don't know")
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach(words, id: \.self) { word in
                        
                        Button {
                            if selectedWords .contains(word) {
                                selectedWords.remove(word)
                            } else {
                                selectedWords.insert(word)
                            }
                        } label: {
                            Text(word)
                                .padding(3)
                                .frame(maxWidth:.infinity)
                                .background(selectedWords.contains(word) ? Color.red : Color.clear)
                        }
                    }
                }
            
        }
            
        }
    }
    
}

struct GeneratedWordsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedWordsView()
    }
}
