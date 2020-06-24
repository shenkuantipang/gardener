//
//  VocabularyOverview.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct VocabularyOverview: View {
    
    @ObservedObject var vocabularyResource: VocabularyResource
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(vocabularyResource.vocabulary) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
            .navigationBarTitle("Vocabulary")
            .onAppear(perform: styleTableView)
        }
        .onAppear { vocabularyResource.loadAll(for: "r11Ylzh8WGO6fHTTd8TL") }
        
    }
    
    
    private func styleTableView() {
        UITableView.appearance().backgroundColor = .systemGroupedBackground
    }
}

struct VocabularyOverview_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyResource = VocabularyResource()
        return VocabularyOverview(vocabularyResource: vocabularyResource)
    }
}
