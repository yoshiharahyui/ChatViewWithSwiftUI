//
//  ChatViewModel.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/10.
//

import Foundation

//データ処理のためのクラス
class ChatViewModel: ObservableObject {
    //戻り値の[Chat]データを格納するプロパティ
    @Published var chatData: [Chat] = []
    //このプロパティラッパーは、値が変更されるたびに通知を発行します
    @Published var messages: [Message] = []
    
    //ChatViewModelが初期化された時に実行される
    init() {
        //fetchChatDataの戻り値が代入される
        chatData = fetchChatData()
        messages = chatData[0].messages
    }
    
    private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
        //ファイルのパスの取得
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        //データの取得
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        //swiftで使用できるデータ形式に変換する
        do {
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました")
        }
    }
    
    func addMessage(chatID: String, text: String) {
        
        guard let index = chatData.firstIndex(where: { chat in
            chat.id == chatID
        }) else { return }
        
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: Date().description,
            readed: false)
        
        chatData[index].messages.append(newMessage)
    }
}
