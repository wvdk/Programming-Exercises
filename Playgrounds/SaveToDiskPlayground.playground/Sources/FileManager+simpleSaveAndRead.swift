//
//  Created by wvdk on 2/10/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//
// https://gist.github.com/wvdk/46dbc3b88a0924e5815e7e68933e31ec
//
// For macOS
//

import Foundation

extension FileManager {
    
    public class func simpleSaveToDesktop(fileName: String, content: String) -> Bool {
        return simpleSave(path: "\(NSHomeDirectory())/Desktop/\(fileName)", content: content, encoding: String.Encoding.utf16)
    }
    
    public class func simpleSave(path: String, content: String, encoding: String.Encoding) -> Bool {
        do {
            try content.write(toFile: path, atomically: true, encoding: encoding)
            return true
        } catch {
            print(error)
            return false
        }
    }
    

    
    
    
    public class func simpleReadFromDesktop(fileName: String) -> String? {
        return simpleRead(path: "\(NSHomeDirectory())/Desktop/\(fileName)", encoding: String.Encoding.utf16)
    }
    
    public class func simpleRead(path: String, encoding: String.Encoding) -> String? {
        if FileManager().fileExists(atPath: path) {
            do {
                return try String(contentsOfFile: path, encoding: encoding)
            } catch {
                print("Error: \(error)")
                
                return nil
            }
        }
        
        return nil
    }
}
