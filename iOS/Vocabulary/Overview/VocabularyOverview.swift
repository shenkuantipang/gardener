//
//  VocabularyOverview.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

let listId = "6dVxYryjwQZrtLzNarV9"

struct VocabularyOverview: View {
    
    @ObservedObject
    var vocabularyStore: VocabularyStore
    
    @State
    private var showAddVocabularyModal = false
    
    @State
    private var deleteVocabularyConfig = DeleteVocabularyConfig()
    
    
    var body: some View {
        NavigationView {
            ScrollView() {
                LazyVStack() {
                    ForEach(vocabularyStore.vocabulary) { vocabulary in
                        VocabularyCardView(vocabulary: vocabulary)
                            .contextMenu { deleteButton(vocabulary) }
                    }
                }
            }
            .navigationBarTitle("Vocabulary")
            .navigationBarItems(trailing: addButton)
            .actionSheet(isPresented: $deleteVocabularyConfig.showConfirmDeletionSheet) {
                confirmDeletionSheet
            }
        }
        .onAppear { vocabularyStore.loadAll(for: listId) }
    }
    
    
    private var addButton: some View {
        let addVocabularyView = AddVocabularyView() { vocabularyStore.add($0, to: listId) }
        return Button("Add") { self.showAddVocabularyModal.toggle() }
            .sheet(isPresented: self.$showAddVocabularyModal) { addVocabularyView }
    }
    
    private func deleteButton(_ vocabulary: Vocabulary) -> some View {
        Button(action: { askToConfirmDeletion(of: vocabulary) },
               label: { Label("Delete", systemImage: "trash") })
    }
    
    private var confirmDeletionSheet: ActionSheet {
        let deletionCandidateName = self.deleteVocabularyConfig.deletionCandidateName ?? "this word"
        let confirmDeletionTitle = Text("Do you really want to delete \(deletionCandidateName)?")
        let confirmDeletionButton = ActionSheet.Button.destructive(Text("Delete word")) {
            withAnimation { deleteVocabulary() }
        }
        return ActionSheet(title: confirmDeletionTitle, message: nil, buttons: [confirmDeletionButton, .cancel()])
    }
    
    
    private func askToConfirmDeletion(at offsets: IndexSet) {
        let deletionCandidateName = offsets.map { "\"\(self.vocabularyStore.vocabulary[$0].foreignName)\"" }.first
        deleteVocabularyConfig.askToConfirm(with: deletionCandidateName, and: offsets)
    }
    
    private func askToConfirmDeletion(of vocabulary: Vocabulary) {
        guard let index = vocabularyStore.vocabulary.firstIndex(where: { $0.id == vocabulary.id }) else { return }
        let deletionCandidateName = "\"\(vocabulary.foreignName)\""
        deleteVocabularyConfig.askToConfirm(with: deletionCandidateName, and: IndexSet(arrayLiteral: index))
    }
    
    private func deleteVocabulary() {
        guard let offsets = self.deleteVocabularyConfig.deletionCandidateOffsets else { return }
        self.vocabularyStore.delete(at: offsets, from: listId)
        self.deleteVocabularyConfig.reset()
    }
    
}


// MARK: - Preview provider

struct VocabularyOverview_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyTestData()
        return VocabularyOverview(vocabularyStore: vocabularyStore)
    }
}
