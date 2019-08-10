//
//  MapViewController.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/10/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewControllerDelegate: class {
    func didTapLocation(_ location: CLLocationCoordinate2D)
}

class MapViewController: UIViewController {
    
    weak var delegate: MapViewControllerDelegate?
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(mapView)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureReconizer:)))
        mapView.addGestureRecognizer(tapRecognizer)
    }
    
    private func setupConstraints() {
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc private func handleTap(gestureReconizer: UIGestureRecognizer) {
        let touchLocation = gestureReconizer.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        delegate?.didTapLocation(locationCoordinate)
    }
}
