//
//  DepartureCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

class DepartureCell : UITableViewCell {

    var flightNum : UILabel!
    var flightTime : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        flightNum = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        flightNum.center = CGPoint(x: 80, y: contentView.frame.height/2)
        flightNum.font = UIFont(name: "Baskerville", size: 20)
        contentView.addSubview(flightNum)
        
        flightTime = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: contentView.frame.height))
        flightTime.center = CGPoint(x: 340, y: contentView.frame.height/2)
        flightTime.font = UIFont(name: "EuphemiaUCAS", size: 16)
        contentView.addSubview(flightTime)
    }
    
}
