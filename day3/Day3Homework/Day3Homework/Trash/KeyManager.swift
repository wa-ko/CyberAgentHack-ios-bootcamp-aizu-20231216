//
//  KeyManager.swift
//  Day3Homework
//
//  Created by 若生優希 on 2024/01/13.
//

//参考:https://qiita.com/Saayaman/items/c50000e6103358c8c4d6

import Foundation


//MARK: apikey.plistを呼ぶヘルパークラス
struct KeyManager {

    private let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist")

    func getKeys() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }

    func getValue(key: String) -> AnyObject? {
        guard let keys = getKeys() else {
            return nil
        }
        return keys[key]! as AnyObject
    }
}
