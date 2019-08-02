//
//  Forecast.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

struct Forecast: Decodable {
    let temperature: Double

    func celsius() -> Double {
        return (temperature - 32) * 0.5
    }
}
