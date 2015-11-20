//
//  NotesListTableTableViewController.swift
//  
//
//  Created by Wesley Van der Klomp on 9/6/15.
//
//

import UIKit

class NotesListTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "createNewNote:")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func createNewNote(sender: AnyObject) {
        
        var newNote = Note(content: "new note")
        NOTES.insert(newNote, atIndex: 0)
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        self.performSegueWithIdentifier("seeNote", sender: self.tableView.cellForRowAtIndexPath(indexPath))
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NOTES.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = NOTES[indexPath.row].title

        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            NOTES.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("NotesListTableTableViewController.prepareForSegue")
        
        // Get the new view controller using [segue destinationViewController].
        var nextScene = segue.destinationViewController as! NoteDetailViewController
        
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            nextScene.noteInQuestion = indexPath.row
        } else {
            // no selected indexPath, so must be creating a new note
            nextScene.noteInQuestion = 0 // Top item
        }
    }

}
