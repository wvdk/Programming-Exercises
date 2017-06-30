//
//  Document.swift
//  LearningDocumentBasedApps
//
//  Created by Wesley Van der Klomp on 6/30/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

