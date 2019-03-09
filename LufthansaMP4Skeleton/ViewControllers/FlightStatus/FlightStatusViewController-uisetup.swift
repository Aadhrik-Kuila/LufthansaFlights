//
//  FlightStatusViewController-uisetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

extension FlightStatusViewController {
    
    func initUI(){
        self.view.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        setupTitle()
        setupFlightNumber()
        setupDatePicker()
        setupButton()
    }
    
    func setupTitle() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: 120)
        titleLabel.text = "Lufthansa Flights"
        titleLabel.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Baskerville", size: 50)
        view.addSubview(titleLabel)
    }
    
    func setupFlightNumber() {
        flightNumberTextField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 80))
        flightNumberTextField.center = CGPoint(x: view.frame.width/2, y: titleLabel.frame.maxY + 80)
        flightNumberTextField.placeholder = "   Flight Number"
        flightNumberTextField.adjustsFontSizeToFitWidth = true
        flightNumberTextField.layer.cornerRadius = 16
        flightNumberTextField.backgroundColor = .white
        view.addSubview(flightNumberTextField)
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 200)
        datePicker.center = CGPoint(x: view.frame.width/2, y: flightNumberTextField.frame.maxY + 150)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .white
        datePicker.layer.cornerRadius = 16
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
    }
    
    func setupButton() {
        button = UIButton(frame: CGRect(x: 50, y: 0, width: view.frame.width - 200, height: 80))
        button.center = CGPoint(x: view.frame.width/2, y: datePicker.frame.maxY + 100)
        button.backgroundColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.setTitle("Find Flight", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Baskerville", size: 40)
        button.setTitleColor(UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        view.addSubview(button)
    }
    
}
