//
//  ListCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Aadhrik Kuila on 3/4/19.
//  Copyright © 2019 Aadhrik Kuila. All rights reserved.
//

import UIKit

class ListCell : UITableViewCell {

    var flightNum : UILabel!
    var flightTime : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor(hue: 0.5806, saturation: 1, brightness: 0.38, alpha: 1.0)
        
        flightNum = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        flightNum.center = CGPoint(x: 80, y: contentView.frame.height/2)
        flightNum.font = UIFont(name: "Baskerville", size: 20)
        flightNum.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        contentView.addSubview(flightNum)
        
        flightTime = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: contentView.frame.height))
        flightTime.center = CGPoint(x: 350, y: contentView.frame.height/2)
        flightTime.font = UIFont(name: "EuphemiaUCAS", size: 16)
        flightTime.textColor = UIColor(hue: 0.1139, saturation: 0.91, brightness: 0.99, alpha: 1.0)
        contentView.addSubview(flightTime)
    }
    
}
