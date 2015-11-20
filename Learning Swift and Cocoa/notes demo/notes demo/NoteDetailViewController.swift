//
//  NoteDetailViewController.swift
//  notes demo
//
//  Created by Wesley Van der Klomp on 9/6/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    var noteInQuestion: Int!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        println("NoteDetialViewController.viewWillAppear")
        noteTextView.text = NOTES[noteInQuestion].content
    }
    
    override func viewWillDisappear(animated: Bool) {
        NOTES[noteInQuestion].content = noteTextView.text
    }

}
