//
//  Item.swift
//  SwiftTest
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import Foundation

struct Item {
    
    let title: String
    let dateTaken: NSDate
    let imageURL: NSURL
    
    var dateTakenString: String {
        
        let dateComponentsFormatter = NSDateComponentsFormatter() // Performance issue here, but cleaner for the purposes of the test
        dateComponentsFormatter.unitsStyle = .Full
        
        let futureDateString = dateComponentsFormatter.stringFromTimeInterval(NSDate().timeIntervalSinceDate(dateTaken))!
        
        return futureDateString + " ago"
    }
}
