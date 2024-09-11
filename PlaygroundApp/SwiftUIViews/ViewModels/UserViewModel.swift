//
//  UserViewModel.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 11/09/24.
//

import Foundation

struct User {
    var name: String
    var email: String
}

class UserViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
