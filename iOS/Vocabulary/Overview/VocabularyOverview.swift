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
    
    @State
    private var showAddVocabularyModal = false
    
    private let listId = "r11Ylzh8WGO6fHTTd8TL"
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(vocabularyStore.vocabulary) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
            .onAppear(perform: styleTableView)
            .navigationBarTitle("Vocabulary")
            .navigationBarItems(trailing: addButton)
        }
        .onAppear { vocabularyStore.loadAll(for: listId) }
    }
    
    
    private var addButton: some View {
        let buttonAction = { self.showAddVocabularyModal.toggle() }
        return Button(action: buttonAction) { Text("Add") }
            .sheet(isPresented: self.$showAddVocabularyModal) { AddVocabularyView() }
    }
    
    
    private func styleTableView() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .systemGroupedBackground
    }
}

struct VocabularyOverview_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyTestData()
        return VocabularyOverview(vocabularyStore: vocabularyStore)
    }
}
