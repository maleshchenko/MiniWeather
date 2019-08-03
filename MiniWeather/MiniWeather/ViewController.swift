//
//  ViewController.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        //fetchInfo()
        fetchTestInfo()
    }
    
    private func setupUI() {
        view.addSubview(mainLabel)
        
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func fetchInfo() {
        NetworkingService().fetchInfo(completion: { [weak self] weatherInfo in
            self?.displayInfo(weatherInfo)
        })
    }

    private func fetchTestInfo() {
        NetworkingService().fetchTestInfo(completion: { [weak self] weatherInfo in
            self?.displayInfo(weatherInfo)
        })
    }

    private func displayInfo(_ info: WeatherInfo) {
        mainLabel.text = Personalization().mode(for: Int(info.currently.celsius()))
    }
}
