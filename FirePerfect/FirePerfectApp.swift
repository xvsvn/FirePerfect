//
//  FirePerfectApp.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
@main
struct lesson6_8App: App {
    @StateObject var session = SessionStore()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            StarterScreen()
                .environmentObject(session)
        }
    }
}
