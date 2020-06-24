//
//  VocabularyResource.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import Firebase
import FirebaseFirestoreSwift

class VocabularyResource: ObservableObject {
    
    private let listsDatabase = Firestore.firestore().collection("lists")
       
    @Published var vocabulary: [Vocabulary] = []
   
   
    func loadAll(for listId: String) {
        let collection = listsDatabase.document(listId).collection("vocabulary").order(by: "createdAt", descending: true)
        collection.addSnapshotListener { (querySnapshot, error) in
            guard error == nil, let snapshot = querySnapshot else { return }
            self.vocabulary = snapshot.documents.compactMap { try? $0.data(as: Vocabulary.self) }
        }
    }
    
    
    func add(_ vocabulary: Vocabulary, to listId: String) {
        let collection = listsDatabase.document(listId).collection("vocabulary")
        let _ = try? collection.addDocument(from: vocabulary)
    }
    
}
