//
//  NSBundle+Additions.swift
//  SwiftTest
//
//  Created by Mark Bridges on 21/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import Foundation


extension NSBundle {
    
    
    func dataForResourceNamed(name: String?, ofType type: String?) -> NSData? {
        
        guard let path = self.pathForResource(name, ofType: type) else {
            return nil
        }

        return NSData(contentsOfFile: path)
    }
}
