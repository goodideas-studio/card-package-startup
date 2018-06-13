//
//  UserDefaults+Extension.swift
//  CardGameWithWeb
//
//  Created by Morris on 2018/6/13.
//  Copyright © 2018 Morris. All rights reserved.
//

import UIKit

extension UserDefaults {
    enum Keys {
        static let gameCoint = "gameCoint"
//        static let gameRecord = "gameRecord"
    }
    static func getGameCoint() -> Int {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.gameCoint)
        return storedValue
    }
    
    static func setGameCoint(round: Int) {
        UserDefaults.standard.set(round, forKey: UserDefaults.Keys.gameCoint)
    }
    
//    static func getGameRecord() -> Int {
//        let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.gameRecord)
//        return storedValue
//    }
//
//    static func setGameRecord(round: Int) {
//        UserDefaults.standard.set(round, forKey: UserDefaults.Keys.gameRecord)
//    }


}
