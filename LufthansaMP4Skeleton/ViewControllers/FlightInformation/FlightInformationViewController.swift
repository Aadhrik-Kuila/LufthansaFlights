//
//  FlightInformationViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit
import MapKit

class FlightInformationViewController: UIViewController {
    
    var date: String!
    var flight: Flight!
    var originAirport: Airport!
    var destinationAirport: Airport!
    var timeStatusLabel: UILabel!
    var depAirportButton: UIButton!
    var arrAirportButton: UIButton!
    var arrow: UILabel!
    var depTimeLabel: UILabel!
    var arrTimeLabel: UILabel!
    var depGateLabel: UILabel!
    var arrGateLabel: UILabel!
    var favoriteButton: UIBarButtonItem!
    var favorite = false
    var mapView: MKMapView!
    var selectedAirport: Airport!
    var aircraft: Aircraft!
    var aircraftLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        createAirports()
        centerMap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "LH\(flight.flightNumber!)"
    }
    
    @objc func saveToFavorites() {
        favorite = true
        let count = UserDefaults.standard.integer(forKey: "favoritesCount")
        let count2 = count + 1
        UserDefaults.standard.set("LH\(flight.flightNumber!)", forKey: "\(count)")
        print("LH\(flight.flightNumber!)")
        date = flight.departureTime
        let index2 = date.index(date.endIndex, offsetBy: -7)
        let substring1 = date[...index2]
        UserDefaults.standard.set(substring1, forKey: "\(count2)")
        print(date!)
        UserDefaults.standard.set(count2 + 1, forKey: "favoritesCount")
        flight.favorite = true
        favoriteButton = UIBarButtonItem(title: "Saved to Favorites!", style: .plain, target: self, action: nil)
        self.navigationItem.setRightBarButton(favoriteButton, animated: true)
    }
    
    func createAirports() {
        mapView.addAnnotation(flight.originAirportObject)
        mapView.addAnnotation(flight.destinationAirportObject)
    }
    
    func centerMap() {
        let midPointlat = (flight.originAirportObject.latitude + flight.destinationAirportObject.latitude) / 2
        let midPointlong = (flight.originAirportObject.longitude + flight.destinationAirportObject.longitude) / 2
        let location = CLLocationCoordinate2D(latitude: midPointlat, longitude: midPointlong)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 3000000, longitudinalMeters: 3000000)
        self.mapView.setRegion(region, animated : true)
    }
    
    @objc func depairportClicked() {
        selectedAirport = flight.originAirportObject!
        performSegue(withIdentifier: "specificAirport", sender: self)
    }
    
    @objc func arrairportClicked() {
        selectedAirport = flight.destinationAirportObject!
        performSegue(withIdentifier: "specificAirport", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? AirportsInformationViewController {
            resultVC.airport = selectedAirport
        }
    }

}
