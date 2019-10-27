//
//  PersistenceManager.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 10/27/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation

struct PersistenceManager {
    
    private let dataKey = "data"
    
    func save(_ string: String) {
        let defaults = UserDefaults.standard
        defaults.setValue(string, forKey: dataKey)
        defaults.synchronize()
    }
    
    func load() -> String {
        return UserDefaults.standard.string(forKey: dataKey) ?? ""
    }
}
