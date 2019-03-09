//
//  Airport.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit

class Airport: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    var latitude: Double!
    var longitude: Double!
    
    var title: String?
    var subtitle: String?
    
    init(data: JSON) {
        latitude = data["Position"]["Coordinate"]["Latitude"].doubleValue
        longitude = data["Position"]["Coordinate"]["Longitude"].doubleValue
        coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        title = data["AirportCode"].stringValue
        subtitle = data["Names"]["Name"]["$"].stringValue
    }
    
}
