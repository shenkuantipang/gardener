//
//  VocabularyStore.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import Firebase
import FirebaseFirestoreSwift

class VocabularyStore: ObservableObject {
    
    @Published
    var vocabulary: [Vocabulary] = []
    
    private let listsCollection = Firestore.firestore().collection("lists")

    ///
    /// Loads all vocabulary entries for the list with a given id.
    /// Further, loaded entries are automatically updated and kept in sync
    /// whenever there is a change within the specified vocabulary list.
    ///
    /// - Parameter listId: The id of the list to load all vocabulary entries for.
    ///
    func loadAll(for listId: String) {
        let collection = listsCollection.document(listId).collection("vocabulary").order(by: "createdAt", descending: true)
        collection.addSnapshotListener { (querySnapshot, error) in
            guard error == nil, let snapshot = querySnapshot else { return }
            self.vocabulary = snapshot.documents.compactMap { try? $0.data(as: Vocabulary.self) }
        }
    }
    
    ///
    /// Adds a new vocabulary entry to the list with a given id.
    ///
    /// - Parameter vocabulary: The new vocabulary entry to add to the list.
    /// - Parameter listId: The id of the list to add the vocabulary entry to.
    ///
    func add(_ vocabulary: Vocabulary, to listId: String) {
        let collection = listsCollection.document(listId).collection("vocabulary")
        let _ = try? collection.addDocument(from: vocabulary)
    }
    
}


// MARK: - Mock implementation

class VocabularyMockStore: VocabularyStore {
    
    override func loadAll(for listId: String) {
        self.vocabulary = [
            Vocabulary(foreignName: "la flor", nativeName: "die Blume"),
            Vocabulary(foreignName: "el bosque", nativeName: "der Wald"),
            Vocabulary(foreignName: "el arbol", nativeName: "der Baum"),
            Vocabulary(foreignName: "el jardin", nativeName: "der Garten")
        ]
    }
    
    override func add(_ vocabulary: Vocabulary, to listId: String) {
        self.vocabulary.append(vocabulary)
    }
    
}
