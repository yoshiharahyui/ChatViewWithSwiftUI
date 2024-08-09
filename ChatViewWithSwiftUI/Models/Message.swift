//
//  Message.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/08.
//

import Foundation

struct Message {
    let id: String = UUID().uuidString
    let text: String
    let user: User
    let date: Date
    let readed: Bool
}
