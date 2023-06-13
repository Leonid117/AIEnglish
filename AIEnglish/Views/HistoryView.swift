//
//  HistoryView.swift
//  AIEnglish
//
//  Created by Leonid Volkov on 13/06/23.
//

import SwiftUI

struct HistoryView: View {
    let history: [String]
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: 10, alignment: .leading),
                GridItem(.flexible(), spacing: 10, alignment: .leading)
            ]
        ) {
            ForEach (history, id: \.self) { historyCell in
                Text(historyCell)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: ["123", "4232", "3242"])
    }
}
