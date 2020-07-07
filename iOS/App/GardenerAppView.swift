//
//  GardenerAppView.swift
//  Gardener
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct GardenerAppView: View {
    
    @ObservedObject var vocabularyStore: VocabularyStore
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            VocabularyOverview(vocabularyStore: vocabularyStore)
                .tabItem {
                    let imageName = selection == 0 ? "book.fill" : "book"
                    Image(systemName: imageName).imageScale(.large)
                    Text("Vocabulary")
                }
                .tag(0)
            ExerciseView()
                .tabItem {
                    let imageName = selection == 1 ? "play.fill" : "play"
                    Image(systemName: imageName).imageScale(.large)
                    Text("Exercise")
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    let imageName = selection == 2 ? "person.fill" : "person"
                    Image(systemName: imageName).imageScale(.large)
                    Text("Profile")
                }
                .tag(2)
        }
    }
}


// MARK: - Preview provider

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        let vocabularyStore = VocabularyTestData()
        return GardenerAppView(vocabularyStore: vocabularyStore)
    }
}
