//
//  RequestBuilder.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation

struct RequestBuilder {

    static func buildURL() -> URL {
        let url = URL(string: Configuration.apiURL)?
            .appendingPathComponent(Configuration.apiKey)
            .appendingPathComponent(Configuration.coordinates)
            .appendingPathComponent(Configuration.defaultParameters)

        return url!
    }
}
