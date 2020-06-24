//
//  VocabularyResource.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import Firebase
import Foundation

class VocabularyResource: ObservableObject {
    
    private let listsDatabase = Firestore.firestore().collection("lists")
       
    @Published var vocabulary: [Vocabulary] = []
   
   
    func loadAll(for listId: String) {
        let collection = listsDatabase.document(listId).collection("vocabulary").order(by: "createdAt", descending: true)
        collection.addSnapshotListener { (querySnapshot, error) in
            guard error == nil else { return }
            self.vocabulary = querySnapshot!.documents.compactMap { Vocabulary(id: $0.documentID, data: $0.data()) }
        }
    }
    
}
