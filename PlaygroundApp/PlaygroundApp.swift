//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 28/08/23.
//

import SwiftUI

@main
struct PlaygroundApp: App {
    let userViewModel = UserViewModel(user: User(name: "Léo", email: "kiszewski1999@gmail.com"))
    
    var body: some Scene {
        WindowGroup {
            PlaygroundListView()
                .environmentObject(userViewModel)
        }
    }
}
