//
//  APIClient.swift
//  SwiftTest
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import Foundation


class APIClient {
        
    
    private let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    private let responseDeserializer = ResponseDeserializer()
    
    
    func downloadItemsWithCompletionHandler(completionHandler: (Result -> Void)) {
        
        let url = NSURL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&lang=en-us&nojsoncallback=1")!
        
        let dataTask = defaultSession.dataTaskWithURL(url) { data, response, error in
            
            guard
                let data = data where error == nil else {
                    completionHandler(.Failure(error))
                    return
            }
            
            do {
                let items = try self.responseDeserializer.deserializeDataIntoItems(data)
                completionHandler(.Success(items))
            } catch {
                completionHandler(.Failure(error))
            }
        }
        
        dataTask.resume()
    }
    
}