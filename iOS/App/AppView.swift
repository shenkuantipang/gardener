//
//  AppView.swift
//  iOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct AppView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
                VocabularyOverview(vocabularyResource: VocabularyResource())
                    .tabItem {
                        Image(systemName: "book.fill").imageScale(.large)
                        Text("Vocabulary")
                    }
                    .tag(0)
                Text("Exercise")
                    .tabItem {
                        Image(systemName: "play.fill").imageScale(.large)
                        Text("Exercise")
                    }
                    .tag(1)
                Text("Profile")
                    .tabItem {
                        Image(systemName: "person.fill").imageScale(.large)
                        Text("Profile")
                    }
                    .tag(2)
            }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
