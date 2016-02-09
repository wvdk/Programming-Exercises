//
//  ViewController.swift
//  core data test
//
//  Created by Wesley Van der Klomp on 2/1/16.
//  Copyright © 2016 Wes Van der Klomp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var messageTitle: UITextField!
    @IBOutlet weak var messageBody: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [[String: String]] = []

    @IBAction func loadMessage(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Messages")
        
//        request.returnsObjectsAsFaults = false

        let results = try? context.executeFetchRequest(request)
        
        if results != nil {
            for result in results! {
                let resultAsManagedObject = result as! NSManagedObject
                let title = resultAsManagedObject.valueForKey("title") as! String
                let body = resultAsManagedObject.valueForKey("body") as! String
                let message: [String: String] = ["title": title, "body": body]
                
                self.messages.append(message)
            }
            
            self.tableView.reloadData()
        } else {
            print("Results is nil")
        }
    }
    
    @IBAction func saveMessage(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let message = NSEntityDescription.insertNewObjectForEntityForName("Messages", inManagedObjectContext: context)
        
        message.setValue(messageTitle.text!, forKey: "title")
        message.setValue(messageBody.text!, forKey: "body")
        
        do {
            try context.save()
            print("Successfully saved:\n\(message)")
        } catch {
            print("Failed to save.")
        }
    }
    
    // MARK: - TABLE VIEW STUFF
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        let message = messages[indexPath.row]["title"]
        
        print("creating cell")
        
        cell.textLabel?.text = message!
        
        return cell
    }
    
    // MARK: - VC LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View did load.")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

