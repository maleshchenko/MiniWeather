//
//  ViewController.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import UIKit
import CoreLocation

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
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        button.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchInfo()
        //fetchTestInfo()
    }
    
    private func setupUI() {
        view.addSubview(mainLabel)
        view.addSubview(menuButton)
        
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
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
        DispatchQueue.main.async { [weak self] in
            self?.mainLabel.text = Personalization().mode(for: Int(info.currently.celsius()))
        }
    }
    
    @objc private func menuTapped() {
        let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let enterLocationAction = UIAlertAction(title: "Enter Location", style: .default) { [weak self] _ in
            let mapController = MapViewController()
            mapController.delegate = self
            self?.present(mapController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        menu.addAction(enterLocationAction)
        menu.addAction(cancelAction)
        
        self.present(menu, animated: true, completion: nil)
    }
}

extension ViewController: MapViewControllerDelegate {
    func didTapLocation(_ location: CLLocationCoordinate2D) {
        Configuration.self.setNewCoordinates(location)
        fetchInfo()
        dismiss(animated: true, completion: nil)
    }
}
