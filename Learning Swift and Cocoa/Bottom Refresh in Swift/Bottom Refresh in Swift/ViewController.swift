//
//  ViewController.swift
//  Bottom Refresh in Swift
//
//  Created by Wesley Van der Klomp on 3/17/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = Items()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.allItems.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row < self.items.allItems.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
            cell.textLabel!.text = items.allItems[indexPath.row]
            
            return cell
        } else {            
            let cell = tableView.dequeueReusableCellWithIdentifier("Loading", forIndexPath: indexPath) as! LoadingTableViewCell

            cell.activityIndication.startAnimating()
            
            items.fetchMoreData({newValue, newIndexPaths in
                self.items = newValue
                
                self.tableView.beginUpdates()
                self.tableView.insertRowsAtIndexPaths(newIndexPaths, withRowAnimation: .Top)
                self.tableView.endUpdates()
            })
            
            return cell
        }
    }

}

