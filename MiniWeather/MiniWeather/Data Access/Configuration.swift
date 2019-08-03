//
//  Configuration.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation

struct Configuration {
    static let scheme = "https"
    static let apiURL = "api.darksky.net"
    static let path = "/forecast"
    static let apiKey = "/your DarkSky API key here"
    static let coordinates = "/50.450875,30.522645"
    static let excludeParams = "exclude"
    static let excludeParamsValue = "daily,hourly,minutely,alerts,flags"
}
