//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire

class LufthansaAPIClient {
    //These are where we will store all of the authentication information. Get these from your account at developer.lufthansa.com.
    static let clientSecret = "" //FIXME
    static let clientID = "" //FIXME
    
    //This variable will store the session's auth token that we will get from getAuthToken()
    static var authToken: String?
    
    //This function will request an auth token from the lufthansa servers
    static func getAuthToken(completion: @escaping () -> ()){
        
        //This is the information that will be sent to the server to authenticate our device
        let requestURL = "https://api.lufthansa.com/v1/references/"
        let parameters = ["":""] //FIXME
        
        //GET RID OF THIS
        completion()
        
        //This is the POST request made to the lufthansa servers to get the authToken for this session.
        /*Alamofire.request(requestURL, method: /*FIXME*/ , parameters: parameters, encoding: URLEncoding(), headers: /*FIXME*/ ).responseJSON { response in
         
         //Converts response to JSON object and sets authToken variable to appropriate value
         let json = JSON() //FIXME
         self.authToken = ""//FIXME
         
         print("Auth token: " + self.authToken!)
         print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
         
         //Runs completion closure
         completion()
         }*/
    }
    
    //This function will get the status for a flight. FlightNum format "LHXXX" Date format "YYYY-MM-DD"
    static func getFlightStatus(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        
        //Request URL and authentication parameters
        let requestURL = "" //FIXME
        let parameters: HTTPHeaders = ["":""] //FIXME
        
        //print("PARAMETERS FOR REQUEST:")
        //print(parameters)
        //print("\n")
        
        //GET RID OF THIS
        completion(Flight())
        
        /*Alamofire.request(requestURL, headers: parameters).responseJSON { response in
         //Makes sure that response is valid
         guard response.result.isSuccess else {
         print(response.result.error.debugDescription)
         return
         }
         //Creates JSON object
         let json = JSON() //FIXME
         print(json)
         //Create new flight model and populate data
         let flight = Flight()
         //FIXME
         completion(flight)
         }*/
    }
}