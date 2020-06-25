//
//  VocabularyOverview.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct VocabularyOverview: View {
    
    @ObservedObject
    var vocabularyStore: VocabularyStore
    
    private let listId = "r11Ylzh8WGO6fHTTd8TL"
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(vocabularyStore.vocabulary) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
            .navigationBarTitle("Vocabulary")
            .onAppear(perform: styleTableView)
        }
        .onAppear { vocabularyStore.loadAll(for: listId) }
    }
    
    
    private func styleTableView() {
        UITableView.appearance().backgroundColor = .systemGroupedBackground
    }
}

struct VocabularyOverview_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyMockStore()
        return VocabularyOverview(vocabularyStore: vocabularyStore)
    }
}
