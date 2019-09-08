//
//  MiniWeatherTests.swift
//  MiniWeatherTests
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import XCTest
@testable import MiniWeather

class MiniWeatherTests: XCTestCase {

    func testModelInit() {
        if let path = Bundle.main.path(forResource: "testData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String: AnyObject], let currently = jsonResult["currently"] as? Double {
                    let forecast = Forecast(temperature: currently)
                    let weatherInfo = WeatherInfo(currently: forecast)
                    
                    XCTAssertNotNil(forecast)
                    XCTAssertNotNil(weatherInfo)
                }
            } catch {
                XCTFail("failed to parse json file")
            }
        } else {
            XCTFail("failed to load json file")
        }
    }
}
