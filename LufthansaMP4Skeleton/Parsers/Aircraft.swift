//
//  Aircraft.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import Foundation
import SwiftyJSON

class Aircraft {
    
    var aircraftCode: String!
    var aircraftName: String!
    
    init(data: JSON) {
        aircraftName = data["AircraftResource"]["AircraftSummaries"]["AircraftSummary"]["Names"]["Name"]["$"].stringValue
        aircraftCode = data["AircraftResource"]["AircraftSummaries"]["AircraftSummary"]["AircraftCode"].stringValue
    }
    
}

