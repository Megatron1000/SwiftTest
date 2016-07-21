//
//  MainViewController.swift
//  SwiftTest
//
//  Created by Mark Bridges on 20/07/2016.
//  Copyright © 2016 BridgeTech. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    private let dataSource = TableDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        refreshControl?.addTarget(self, action: #selector(refreshData), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    internal func refreshData() {
        dataSource.refreshDataWithCompletionHandler { result in
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
            switch result {
            case .Failure(let error):
                print("Error refreshing data \(error)")
                let errorAlertController = UIAlertController(error: error)
                self.presentViewController(errorAlertController, animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
}
