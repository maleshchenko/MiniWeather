//
//  ViewController.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiURL = "https://api.darksky.net/forecast"
    let apiKey = "your DarkSky API key here"
    let coordinates = "50.450875,30.522645"
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        label.font = UIFont(name: "Menlo", size: 50)!
        label.textColor = .white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchInfo()
    }
    
    private func setupUI() {
        view.addSubview(mainLabel)
        
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func fetchInfo() {
        let session = URLSession(configuration:.default)
        let task: URLSessionTask = session.dataTask(with: URLRequest(url: buildURL())) { (dataOrNil, responseOrNil, errorOrNil) in
            if let path = Bundle.main.path(forResource: "testData", ofType: "json") {
                do {
                    let fileUrl = URL(fileURLWithPath: path)
                    let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                    let jsonString = String(data: data, encoding: .utf8)!
                    print(jsonString)
                } catch {
                    print("failed to load data")
                }
            }
        }
        task.resume()
    }
    
    private func buildURL() -> URL {
        return URL(string: "\(apiURL)/\(apiKey)/\(coordinates)")!
    }
}

