//
//  AirportsInformationViewController-uisetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

extension AirportsInformationViewController {
    
    func setupSegmentedControl() {
        let items = ["Departures", "Arrivals"]
        customSC = UISegmentedControl(items: items)
        customSC.frame = CGRect(x: 0, y: 0, width: 240, height: 40)
        customSC.center = CGPoint(x: view.frame.width/2, y: mapView.frame.maxY + 40)
        customSC.selectedSegmentIndex = 0
        customSC.layer.cornerRadius = 8;
        customSC.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        customSC.tintColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        customSC.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        view.addSubview(customSC)
        view.bringSubviewToFront(customSC)
    }
    
    func displayList() {
        tableView = UITableView(frame: CGRect(x: 0, y: customSC.frame.maxY + 15, width: view.frame.width, height: 400))
        tableView.register(ListCell.self, forCellReuseIdentifier: "FlightList")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        view.addSubview(tableView)
    }
    
    func displayDepartures() {
        toShow = departures
        tableView.reloadData()
    }
    
    func displayArrivals() {
        toShow = arrivals
        tableView.reloadData()
    }
}
