//
//  VocabularyResource.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import Foundation

class VocabularyResource: ObservableObject {
    
    @Published var vocabulary: [Vocabulary] = []
    
    
    func loadAll(for listId: String) {
        vocabulary = [
            Vocabulary(nativeName: "der Wald", foreignName: "el bosque"),
            Vocabulary(nativeName: "der Baum", foreignName: "el arbol")
        ]
    }
    
}
