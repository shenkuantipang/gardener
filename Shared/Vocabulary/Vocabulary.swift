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
    let level: Int
    
    ///
    /// Convenience initializer.
    ///
    /// - Parameter id: An identifier of the vocabulary entry.
    /// - Parameter foreignName: The name of the vocabulary in foreign language.
    /// - Parameter nativeName: The name of the vocabulary in native language.
    ///
    init(id: String?, foreignName: String, nativeName: String) {
        self.id = id
        self.nativeName = nativeName
        self.foreignName = foreignName
        self.imageUrl = nil
        self.level = 1
    }
    
    ///
    /// Minimal convenience initializer.
    ///
    /// - Parameter foreignName: The name of the vocabulary in foreign language.
    /// - Parameter nativeName: The name of the vocabulary in native language.
    ///
    init(foreignName: String, nativeName: String) {
        self.init(id: nil, foreignName: foreignName, nativeName: nativeName)
    }
    
}
