//
//  Personalization.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation

struct Personalization {
    let range: [Int] = Array(-20...40)
    let months: [Int] = Array(1...12)
    
    struct Months {
        static let winter = 1 ..< 2
        static let summer = 6 ..< 8
    }
    
    struct Mode {
        static let tooCold = "Too Cold"
        static let perfect = "Perfect!"
        static let tooHot =  "Too Hot"
    }
    
    struct Ranges {
        static let winterColdRange = -20 ..< -5
        static let hotRange = 25 ..< 40
        static let otherColdRange = -5 ..< 15
    }
    
    private func month() -> Int {
        let lastMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let calendar = Calendar.current
        return calendar.component(.month, from: lastMonthDate!)
    }
    
    func mode(for temparature: Int) -> String {
        let currentMonth = month()
        if Months.winter.contains(currentMonth) {
            return Ranges.winterColdRange.contains(temparature) ? Mode.tooCold : Mode.perfect
        } else if Months.summer.contains(currentMonth) {
            if Ranges.hotRange.contains(temparature) {
                return Mode.tooHot
            } else if Ranges.otherColdRange.contains(temparature) {
                return Mode.tooCold
            }
            return Mode.perfect
        }
        
        return Ranges.otherColdRange.contains(temparature) ? Mode.tooCold : Mode.perfect
    }
}
