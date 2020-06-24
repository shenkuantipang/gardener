//
//  Vocabulary.swift
//  iOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import Foundation
import FirebaseFirestoreSwift 

struct Vocabulary: Identifiable, Codable {
    
    @DocumentID
    var id: String?
    
    @ServerTimestamp
    var createdAt: Date?
    
    let foreignName: String
    let nativeName: String
    let imageUrl: URL?
    
}
