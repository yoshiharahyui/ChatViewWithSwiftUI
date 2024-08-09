//
//  DataModelTest.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/08.
//

import SwiftUI

struct DataModelTest: View {
    
    let user1 = User(id: "1", name: "ka-ki", image: "user1")
    let user2 = User(id: "2", name: "aa", image: "user2")
    
    let message = Message(
        text: "こんにちわ",
        user: User(id: "1", name: "ka-ki", image: "user1"),
        date: Date(),
        readed: false)
    
    var body: some View {
        VStack {
            Text(user1.name)
            //Image(user1.image)
            //Image(user2.image)
            Text(message.text)
            Text(message.user.name)
        }
    }
}

#Preview {
    DataModelTest()
}
