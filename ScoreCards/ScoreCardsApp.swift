//
//  ScoreCardsApp.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI
import Firebase

@main
struct ScoreCardsApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ScoreListView()
        }
    }
}
