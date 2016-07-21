//
//  UIAlertController+ErrorHelpers.swift
//
//
//  Created by Mark.Bridges on 17/11/2015.
//  Copyright © 2015 BridgeTech. All rights reserved.
//
// 


import UIKit


extension UIAlertController {
    
    
    /// Created an alert style alert controller with for the given error
    convenience init(error: ErrorType?, dismissedHandler:((Void) -> Void)? = nil) {
        
        self.init(title: "Drat", message: UIAlertController.messageForError(error), preferredStyle: .Alert)
        
        addAction(UIAlertAction(title: "OK", style: .Default, handler:{ action in
            dismissedHandler?()
        }))
    }

    
    class func messageForError(error: ErrorType?) -> String {
        // TODO: Decypher error type into a user facing error
        return "\(error)"
    }
    
}

