//
//  GardenerApp.swift
//  Shared
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI
import Firebase

@main
struct GardenerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            GardenerAppView()
        }
    }
}
