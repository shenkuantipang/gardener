//
//  VocabularyTestData.swift
//  Gardener
//
//  Created by Stefan Cimander on 26.06.20.
//

///
/// Mock implementation of the vocabulary store providing test data for previews.
///
class VocabularyTestData: VocabularyStore {
    
    override func loadAll(for listId: String) {
        self.vocabulary = [
            Vocabulary(id: "3hG2XDnWcaiatwgvkYXm", foreignName: "la flor", nativeName: "die Blume"),
            Vocabulary(id: "WX2dBdTYLGaKkWH8sN57", foreignName: "el bosque", nativeName: "der Wald"),
            Vocabulary(id: "oN9Zexy5CskXvry0HL3Q", foreignName: "el arbol", nativeName: "der Baum"),
            Vocabulary(id: "B5lOcX4HZ6rNyIP5E9lj", foreignName: "el jardin", nativeName: "der Garten")
        ]
    }
    
    override func add(_ vocabulary: Vocabulary, to listId: String) {
        self.vocabulary.append(vocabulary)
    }
    
}
