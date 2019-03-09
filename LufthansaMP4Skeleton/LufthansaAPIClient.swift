//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LufthansaAPIClient {

    static let clientSecret = "7DdvUaUP2A"
    static let clientID = "t2r23bh8tqzveaa33xu3rccn"
    
    static var authToken: String?
    
    static func getAuthToken(completion: @escaping () -> ()){
        let requestURL = "https://api.lufthansa.com/v1/oauth/token" //FIXME
        let parameters = ["client_id": "\(clientID)", "client_secret" : "\(clientSecret)", "grant_type" : "client_credentials"] //FIXME
        Alamofire.request(requestURL, method: .post , parameters: parameters, encoding: URLEncoding()).responseJSON { response in
            let json = JSON(response.result.value) //FIXME
            self.authToken = json["access_token"].stringValue//FIXME
            print("Auth token: " + self.authToken!)
            print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
            completion()
        }
        
    }
    
    static func getFlightStatus(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization" : "Bearer \(self.authToken!)"]
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value) //FIXME
            let data = json["FlightStatusResource"]["Flights"]["Flight"]
            let flight = Flight(data: data)
            completion(flight)
        }
        
    }
    
    static func getAirport(airportCode: String, completion: @escaping (Airport) -> ()) {
        let requestURL = "https://api.lufthansa.com/v1/references/airports/\(airportCode)?lang=en"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization" : "Bearer \(self.authToken!)"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            let data = json["AirportResource"]["Airports"]["Airport"]
            let airport = Airport(data: data)
            completion(airport)
        }
        
    }
    
    static func getLHAirports(offset: Int, completion: @escaping ([Airport]) -> ()) {
        let requestURL = "https://api.lufthansa.com/v1/references/airports/?lang=en&limit=100&offset=\(offset)&LHoperated=1"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization" : "Bearer \(self.authToken!)"]
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            let airports = json["AirportResource"]["Airports"]["Airport"].arrayValue
            var returnAirports: [Airport] = []
            for i in 0..<airports.count {
                returnAirports.append(Airport(data: airports[i]))
            }
            completion(returnAirports)
        }
        
    }
    
    static func getFlightsFrom(type: String, airportCode: String, currentDate: String, completion: @escaping ([Flight]) -> ()) {
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(type)/\(airportCode)/\(currentDate)"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization" : "Bearer \(self.authToken!)"]
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            let flights = json["FlightStatusResource"]["Flights"]["Flight"].arrayValue
            var returnFlights: [Flight] = []
            for i in 0..<flights.count {
                returnFlights.append(Flight(data: flights[i]))
            }
            completion(returnFlights)
        }
        
    }
    
    static func getAircraft(type: String, completion: @escaping (Aircraft) -> ()) {
        let requestURL = "https://api.lufthansa.com/v1/references/aircraft/\(type)"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization" : "Bearer \(self.authToken!)"]
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            completion(Aircraft(data: json))
        }
        
    }
    
}
