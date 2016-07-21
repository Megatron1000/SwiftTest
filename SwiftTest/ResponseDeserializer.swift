//
//  ResponseDeserializer.swift
//  SwiftTest
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import Foundation


class ResponseDeserializer {
    
    enum Error: ErrorType {
        case UnrecognisedResponse
        case MissingItemsArray
        case MissingItemKey
        case UnparsableDate
        case UnreadableURL
    }
    
    
    private lazy var dateFormatter: NSDateFormatter = {
        let newDateFormatter = NSDateFormatter()
        newDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        newDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return newDateFormatter
    } ()
    
    
    func deserializeDataIntoItems(data: NSData) throws -> [Item] {
        
        guard let rootDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments]) as? [String : AnyObject] else {
            throw Error.UnrecognisedResponse
        }
        
        guard let itemDictionaries = rootDictionary["items"] as? [[String : AnyObject]] else {
            throw Error.MissingItemsArray
        }
        
        let items: [Item] = try itemDictionaries.map { itemDictionary in
            guard
                let title = itemDictionary["title"] as? String,
                let dateTakenString = itemDictionary["date_taken"] as? String,
                let imageURLString = itemDictionary["media"]?["m"] as? String else {
                    throw Error.MissingItemKey
            }
            
            guard
                let dateTaken = dateFormatter.dateFromString(dateTakenString) else {
                    throw Error.UnparsableDate
            }
            
            guard
                let imageURL = NSURL(string: imageURLString) else {
                    throw Error.UnreadableURL
            }
            
            return Item(title: title, dateTaken: dateTaken, imageURL: imageURL)
        }
        
        return items
    }
    
}
