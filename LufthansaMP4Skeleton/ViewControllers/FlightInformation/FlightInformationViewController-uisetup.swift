//
//  FlightInformationViewController-uisetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit
import MapKit

extension FlightInformationViewController {
    
    func initUI() {
        self.view.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        if flight.favorite == false {
            favoriteButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveToFavorites))
            self.navigationItem.setRightBarButton(favoriteButton, animated: true)
        } else {
            favoriteButton = UIBarButtonItem(title: "Saved to Favorites!", style: .plain, target: self, action: nil)
            self.navigationItem.setRightBarButton(favoriteButton, animated: true)
        }
        setupTimeStatus()
        setupDepAirportButton()
        setupArrAirportButton()
        setupArrow()
        setupDepTime()
        setupArrTime()
        setupMap()
        setupAircraft()
    }
    
    func setupTimeStatus() {
        timeStatusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        timeStatusLabel.center = CGPoint(x: view.frame.width/2, y: 450)
        timeStatusLabel.text = flight.timeStatus
        timeStatusLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        timeStatusLabel.textAlignment = .center
        timeStatusLabel.font = UIFont(name: "Baskerville", size: 40)
        view.addSubview(timeStatusLabel)
    }
    
    func setupDepAirportButton() {
        depAirportButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: 100))
        depAirportButton.center = CGPoint(x: view.frame.width/4, y: timeStatusLabel.frame.maxY + 75)
        depAirportButton.backgroundColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        depAirportButton.setTitle("\(flight.originAirport!)", for: .normal)
        depAirportButton.setTitleColor(UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0), for: .normal)
        depAirportButton.titleLabel?.font =  UIFont(name: "Baskerville", size: 40)
        depAirportButton.layer.cornerRadius = 16
        depAirportButton.addTarget(self, action: #selector(depairportClicked), for: .touchUpInside)
        view.addSubview(depAirportButton)
    }
    
    func setupArrAirportButton() {
        arrAirportButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: 100))
        arrAirportButton.center = CGPoint(x: (view.frame.width/4) * 3, y: timeStatusLabel.frame.maxY + 75)
        arrAirportButton.backgroundColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        arrAirportButton.setTitle("\(flight.destinationAirport!)", for: .normal)
        arrAirportButton.setTitleColor(UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0), for: .normal)
        arrAirportButton.titleLabel?.font =  UIFont(name: "Baskerville", size: 40)
        arrAirportButton.layer.cornerRadius = 16
        arrAirportButton.addTarget(self, action: #selector(arrairportClicked), for: .touchUpInside)
        view.addSubview(arrAirportButton)
    }
    
    func setupArrow() {
        arrow = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        arrow.center = CGPoint(x: view.frame.width/2, y: timeStatusLabel.frame.maxY + 50)
        arrow.text = "hello"
        arrow.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        arrow.font = UIFont(name: "Baskerville", size: 50)
        view.addSubview(arrow)
    }
    
    func setupDepTime() {
        depTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        depTimeLabel.center = CGPoint(x: depAirportButton.frame.midX, y: depAirportButton.frame.maxY + 50)
        depTimeLabel.textAlignment = .center
        let date = flight.departureTime!
        let index = date.index(date.endIndex, offsetBy: -5)
        let substring = date[index...]
        depTimeLabel.text = String(substring)
        depTimeLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        depTimeLabel.font = UIFont(name: "Baskerville", size: 30)
        view.addSubview(depTimeLabel)
    }
    
    func setupArrTime() {
        arrTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        arrTimeLabel.center = CGPoint(x: arrAirportButton.frame.midX, y: arrAirportButton.frame.maxY + 50)
        arrTimeLabel.textAlignment = .center
        let date = flight.arrivalTime!
        let index = date.index(date.endIndex, offsetBy: -5)
        let substring = date[index...]
        arrTimeLabel.text = String(substring)
        arrTimeLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        arrTimeLabel.font = UIFont(name: "Baskerville", size: 30)
        view.addSubview(arrTimeLabel)
    }
    
    func setupMap() {
        mapView = MKMapView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: 300))
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    func setupAircraft() {
        aircraftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        aircraftLabel.center = CGPoint(x: view.frame.width/2, y: 730)
        print(flight.aircraftObject)
        aircraftLabel.text = "Aircraft: " + flight.aircraftObject.aircraftName!
        aircraftLabel.textAlignment = .center
        aircraftLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        aircraftLabel.font = UIFont(name: "Baskerville", size: 20)
        view.addSubview(aircraftLabel)
    }
    
}
