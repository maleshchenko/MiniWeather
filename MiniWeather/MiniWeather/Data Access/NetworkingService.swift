//
//  NetworkingService.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/3/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import Foundation
import os.log

struct NetworkingService {
    
    func fetchInfo(completion: @escaping (WeatherInfo) -> Void) {
        let session = URLSession(configuration: .default)
        let task: URLSessionTask = session.dataTask(with: URLRequest(url: RequestBuilder.buildURL())) { (dataOrNil, _, error) in
            guard let data = dataOrNil else { return }
            do {
                let forecast = try JSONDecoder().decode(WeatherInfo.self, from: data)
                completion(forecast)
            } catch {
                os_log("Got error %@ when trying to parse info", log: Logging().networkingLog, type: .error, error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func fetchTestInfo(completion: @escaping (WeatherInfo) -> Void) {
        if let path = Bundle.main.path(forResource: "testData", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let forecast = try JSONDecoder().decode(WeatherInfo.self, from: data)
                completion(forecast)
            } catch {
                os_log("Got error %@ when trying to load local file", log: Logging().persistencegLog, type: .error, error.localizedDescription)
            }
        }
    }
}
