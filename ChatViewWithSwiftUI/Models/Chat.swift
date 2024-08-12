//
//  Chat.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/08.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let messages: [Message]
}
