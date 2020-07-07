//
//  DeleteVocabularyConfig.swift
//  Gardener
//
//  Created by Stefan Cimander on 07.07.20.
//

import SwiftUI

struct DeleteVocabularyConfig {
    
    var showConfirmDeletionSheet = false
    var deletionCandidateName: String?
    var deletionCandidateOffsets: IndexSet?
    
    mutating func askToConfirm(with deletionCandidateName: String?, and deletionCandidateOffsets: IndexSet?) {
        self.showConfirmDeletionSheet = true
        self.deletionCandidateName = deletionCandidateName
        self.deletionCandidateOffsets = deletionCandidateOffsets
    }
    
    mutating func reset() {
        self.showConfirmDeletionSheet = false
        self.deletionCandidateName = nil
        self.deletionCandidateOffsets = nil
    }
    
}
