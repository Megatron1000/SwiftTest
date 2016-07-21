//
//  DataSource.swift
//  SwiftTest
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import UIKit
import AlamofireImage


enum Result {
    case Success([Item])
    case Failure(ErrorType?)
}


class TableDataSource: NSObject {
    
    private var items: [Item] = []
    private let apiClient = APIClient()
}


extension TableDataSource: UITableViewDataSource {

    
    func refreshDataWithCompletionHandler(completionHandler: (Result -> Void)) {
        apiClient.downloadItemsWithCompletionHandler { result in
            
            dispatch_async(dispatch_get_main_queue(),{
                
                switch result {
                case .Success(let items):
                    self.items = items
                    
                case .Failure:
                    self.items.removeAll()
                }
                
                completionHandler(result)
            })
            
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.reuseIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.dateTakenString
        cell.photoImageView.af_setImageWithURL(item.imageURL)
        
        return cell
    }
    
}
