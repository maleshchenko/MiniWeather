//
//  Logging.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation
import os.log

struct Logging {
    static let subsystem = "com.nick130586.miniweather"

    let networkingLog = OSLog(subsystem: Logging.subsystem, category: Logging.Category.network)
    let persistencegLog = OSLog(subsystem: Logging.subsystem, category: Logging.Category.persistence)

    struct Category {
        static let network = "Network"
        static let persistence = "Persistence"
    }
}
