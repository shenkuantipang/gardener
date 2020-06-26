//
//  GardenerAppView.swift
//  macOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct GardenerAppView: View {
    
    @ObservedObject
    var vocabularyStore: VocabularyStore
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyTestData()
        return GardenerAppView(vocabularyStore: vocabularyStore)
    }
}
