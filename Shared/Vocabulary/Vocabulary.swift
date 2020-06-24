//
//  Vocabulary.swift
//  iOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import Foundation

struct Vocabulary: Identifiable {
    
    let id: String
    let nativeName: String
    let foreignName: String
    let imageUrl: URL?
    let createdAt: Date
    
    
    init(id: String, nativeName: String, foreignName: String, imageUrl: URL?, createdAt: Date) {
        self.id = id
        self.nativeName = nativeName
        self.foreignName = foreignName
        self.imageUrl = imageUrl
        self.createdAt = createdAt
    }
    
    init(nativeName: String, foreignName: String) {
        self.init(id: UUID().uuidString, nativeName: nativeName, foreignName: foreignName, imageUrl: nil, createdAt: Date())
    }
    
}
