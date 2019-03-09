//
//  AirportsInformationViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit
import MapKit

class AirportsInformationViewController: UIViewController {
    
    var airport: Airport!
    var mapView: MKMapView!
    var tableView: UITableView!
    var customSC: UISegmentedControl!
    var departures: [Flight] = []
    var arrivals: [Flight] = []
    var toShow: [Flight] = []
    var selectedFlight: Flight!
    var loadingLabel: UILabel!
    var loadingScreen: UIView!
    var loadingText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        createMap()
        setupSegmentedControl()
        centerMap()
        createAnnotations()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        let final = result + "T12:00"
        getFlights(date: final)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "\(airport.subtitle!)"
        if loadingScreen != nil {
            loadingScreen.removeFromSuperview()
            loadingText.removeFromSuperview()
        }
    }
    
    func createMap() {
        mapView = MKMapView(frame: CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height/3))
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    func centerMap() {
        let region = MKCoordinateRegion(center: airport.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
        self.mapView.setRegion(region, animated : true)
    }
    
    func createAnnotations() {
        mapView.addAnnotation(airport)
    }
    
    @objc func indexChanged(_ sender: Any) {
        switch customSC.selectedSegmentIndex {
        case 0 : displayDepartures()
        case 1: displayArrivals()
        default: break
        }
    }

    func getFlights(date: String) {
        loadingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        loadingLabel.center = CGPoint(x: view.frame.width/2, y: customSC.frame.maxY + 100)
        loadingLabel.text = "Retrieving Flight Info..."
        loadingLabel.font = UIFont(name: "Baskerville", size: 30)
        loadingLabel.textAlignment = .center
        self.view.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        loadingLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        view.addSubview(loadingLabel)
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getFlightsFrom(type: "departures", airportCode: "\(self.airport.title!)", currentDate: "\(date)") { flts in
                self.departures = flts
                LufthansaAPIClient.getFlightsFrom(type: "arrivals", airportCode: "\(self.airport.title!)", currentDate: "\(date)") { arrs in
                    self.arrivals = arrs
                    self.toShow = self.departures
                    self.displayList()
                }
            }
        }
    }
    
    func segue() {
        performSegue(withIdentifier: "toShowFlight", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? FlightInformationViewController {
            resultVC.flight = selectedFlight
        }
    }
    
}
