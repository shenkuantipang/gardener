//
//  VocabularyOverview.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

let listId = "r11Ylzh8WGO6fHTTd8TL"

struct VocabularyOverview: View {
    
    @ObservedObject
    var vocabularyStore: VocabularyStore
    
    @State
    private var showAddVocabularyModal = false
    
    @State
    private var showConfirmDeletionSheet = false
    
    @State
    private var deletionCandidateName: String?
    
    @State
    private var deletionCandidateOffsets: IndexSet?
    
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(vocabularyStore.vocabulary) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                        .contextMenu { deleteButton(vocabulary) }
                }
                .onDelete(perform: self.askToConfirmDeletion)
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
            .onAppear(perform: styleTableView)
            .navigationBarTitle("Vocabulary")
            .navigationBarItems(trailing: addButton)
            .actionSheet(isPresented: $showConfirmDeletionSheet) { confirmDeletionSheet }
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
        let deletionCandidateName = self.deletionCandidateName ?? "this word"
        let confirmDeletionTitle = Text("Do you really want to delete \(deletionCandidateName)?")
        let confirmDeletionButton = ActionSheet.Button.destructive(Text("Delete word")) {
            guard let offsets = self.deletionCandidateOffsets else { return }
            self.vocabularyStore.delete(at: offsets, from: listId)
            self.deletionCandidateName = nil
            self.deletionCandidateOffsets = nil
        }
        return ActionSheet(title: confirmDeletionTitle, message: nil, buttons: [confirmDeletionButton, .cancel()])
    }
    
    
    private func askToConfirmDeletion(at offsets: IndexSet) {
        deletionCandidateName = offsets.map { "\"\(self.vocabularyStore.vocabulary[$0].foreignName)\"" }.first
        deletionCandidateOffsets = offsets
        showConfirmDeletionSheet.toggle()
    }
    
    private func askToConfirmDeletion(of vocabulary: Vocabulary) {
        guard let index = vocabularyStore.vocabulary.firstIndex(where: { $0.id == vocabulary.id }) else { return }
        deletionCandidateName = "\"\(vocabulary.foreignName)\""
        deletionCandidateOffsets = IndexSet(arrayLiteral: index)
        showConfirmDeletionSheet.toggle()
    }
    
    
    private func styleTableView() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .systemGroupedBackground
        UITableView.appearance().backgroundColor = .systemGroupedBackground
    }
    
}


// MARK: - Preview provider

struct VocabularyOverview_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyTestData()
        return VocabularyOverview(vocabularyStore: vocabularyStore)
    }
}
