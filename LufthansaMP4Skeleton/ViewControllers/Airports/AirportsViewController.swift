//
//  AirportsViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit
import MapKit

class AirportsViewController: UIViewController {
    
    var loadingLabel: UILabel!
    var mapView: MKMapView!
    var airports: [Airport] = []
    var selectedAirport: Airport!

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingScreen()
        loadAirports()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showLoadingScreen() {
        self.view.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        loadingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        loadingLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        loadingLabel.text = "Finding Airports..."
        loadingLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        loadingLabel.textAlignment = .center
        loadingLabel.font = UIFont(name: "Baskerville", size: 30)
        view.addSubview(loadingLabel)
    }
    
    func loadAirports() {
        LufthansaAPIClient.getAuthToken {
            LufthansaAPIClient.getLHAirports(offset: 0) { lst in
                for i in 0..<lst.count {
                    self.airports.append(lst[i])
                }
                LufthansaAPIClient.getLHAirports(offset: 100) { lst2 in
                    for i in 0..<lst2.count {
                        self.airports.append(lst2[i])
                    }
                    LufthansaAPIClient.getLHAirports(offset: 200) { lst3 in
                        for i in 0..<lst3.count {
                            self.airports.append(lst3[i])
                        }
                        self.createMap()
                        self.createAnnotations()
                    }
                }
            }
        }
    }
    
    func createMap() {
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    func createAnnotations() {
        for airport in airports {
            mapView.addAnnotation(airport)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? AirportsInformationViewController {
            resultVC.airport = selectedAirport
        }
    }
    
}
