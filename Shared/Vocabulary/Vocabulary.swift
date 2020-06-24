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


// MARK: - Firebase initialization

import Firebase

extension Vocabulary {
    
    init?(id: String, data: [String: Any]) {
        guard
            let nativeName = data["nativeName"] as? String,
            let foreignName = data["foreignName"] as? String,
            let createdAt = (data["createdAt"] as? Timestamp)?.dateValue()
        else { return nil }
        
        let urlString = data["imageUrl"] as? String
        let imageUrl = URL(string: urlString ?? "")
        
        self.init(id: id, nativeName: nativeName, foreignName: foreignName, imageUrl: imageUrl, createdAt: createdAt)
    }
}
