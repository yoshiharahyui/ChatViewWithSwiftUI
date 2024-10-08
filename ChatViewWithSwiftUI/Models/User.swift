//
//  User.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/08.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let image: String
    
    var isCurrentUser: Bool {
        self.id == User.currentUser.id
    }
    
    static var currentUser: User {
        User(id: "1", name: "sss", image: "user01")
    }
}
