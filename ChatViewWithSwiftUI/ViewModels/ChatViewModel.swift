//
//  ChatViewModel.swift
//  ChatViewWithSwiftUI
//
//  Created by 吉原飛偉 on 2024/08/10.
//

import Foundation

//データ処理のためのクラス
class ChatViewModel {
    
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
    
}
