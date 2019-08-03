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
        var components = URLComponents()
        components.scheme = Configuration.scheme
        components.host = Configuration.apiURL
        components.path = Configuration.path + Configuration.apiKey + Configuration.coordinates
        components.queryItems = [
            URLQueryItem(name: Configuration.excludeParams, value: Configuration.excludeParamsValue)
        ]

        return components.url!
    }
}
