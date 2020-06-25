//
//  Vocabulary.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import FirebaseFirestoreSwift 

struct Vocabulary: Identifiable, Codable {
    
    @DocumentID
    var id: String?
    
    @ServerTimestamp
    var createdAt: Date?
    
    let foreignName: String
    let nativeName: String
    let imageUrl: URL?
    
    ///
    /// Minimal convenience initializer.
    ///
    /// - Parameter foreignName: The name of the vocabulary in foreign language.
    /// - Parameter nativeName: The name of the vocabulary in native language.
    ///
    init(foreignName: String, nativeName: String) {
        self.foreignName = foreignName
        self.nativeName = nativeName
        self.imageUrl = nil
    }
    
}
