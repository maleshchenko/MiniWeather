//
//  Configuration.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation
import CoreLocation

struct Configuration {
    static let scheme = "https"
    static let apiURL = "api.darksky.net"
    static let path = "/forecast"
    static let apiKey = "/your DarkSky API key here"
    static let defaultCoordinates = "/50.450875,30.522645"
    static let excludeParams = "exclude"
    static let excludeParamsValue = "daily,hourly,minutely,alerts,flags"
    
    static let locationKey = "location"
    
    static func setNewCoordinates(_ coordinates: CLLocationCoordinate2D) {
        UserDefaults.standard.setValue("/\(coordinates.latitude),\(coordinates.longitude)", forKey: locationKey)
        UserDefaults.standard.synchronize()
    }
    
    static var coordinates: String {
        return UserDefaults.standard.string(forKey: locationKey) ?? defaultCoordinates
    }
}
