//
//  ItemTests.swift
//  SwiftTest
//
//  Created by Mark Bridges on 21/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import XCTest
@testable import SwiftTest

class ItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDateTakenString() {
        
        let testDate = NSDate(timeIntervalSinceNow: -(24*60*60)) // 1 day ago
        
        let item = Item(title: "", dateTaken: testDate, imageURL: NSURL())
        
        XCTAssertEqual(item.dateTakenString, "1 day ago")
    }
    
    
}