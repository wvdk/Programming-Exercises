//
//  ViewController.swift
//  Bottom Refresh in Swift
//
//  Created by Wesley Van der Klomp on 3/17/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Model
    
    var items: [String] = []

    var fetchInProgress = false

    func fetchMoreData() {
        if fetchInProgress {
            return
        } else {
            fetchInProgress = true
            
            // This simulates a background fetch by delaying for a second
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1), dispatch_get_main_queue(), {
                self.items += self.generateSomeItems()
                
                self.tableView.beginUpdates()
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.items.count, inSection: 0)], withRowAnimation: .Top)
                self.fetchInProgress = false
                self.tableView.endUpdates()
            })
        }
    }
    
    private func generateSomeItems() -> [String] {
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .SpellOutStyle
        
        var generatedItems: [String] = []
        
        for _ in 0...20 {
            generatedItems.append(formatter.stringFromNumber(items.count + 1)!)
        }
        
        return generatedItems
    }


    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = generateSomeItems()
    }
    
    // MARK: - Table view stuff
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row < self.items.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
            cell.textLabel!.text = items[indexPath.row]
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("Loading", forIndexPath: indexPath) as? LoadingTableViewCell

//            cell.activityIndicatorView.startAnimating()
            
            fetchMoreData()
            
            return cell!
        }
    }

}

