//
//  SwiftTestTests.swift
//  SwiftTestTests
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import XCTest
@testable import SwiftTest

class ResponseDeserializerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDeserializingCompleteData() {
        
        let responseDeserializer = ResponseDeserializer()
        
        let data = NSBundle(forClass: ResponseDeserializerTests.self).dataForResourceNamed("GoodFixture", ofType: "json")!
        
        do {
            let items = try responseDeserializer.deserializeDataIntoItems(data)
            XCTAssertEqual(items.count, 20)
        } catch {
            XCTFail()
        }
    }
    
    
}
