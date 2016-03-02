//
//  ViewController.swift
//  Error handling in Swift 2
//
//  Created by Wesley Van der Klomp on 3/1/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

enum EncryptionError: ErrorType {
    case Empty
    case Short
    case Obvious
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let encrypted = try encryptString("seceret information!", withPassword: "password")
            print(encrypted)
        } catch EncryptionError.Empty {
            print("Missing password")
        } catch EncryptionError.Short {
            print("Password must be longer")
        } catch EncryptionError.Obvious {
            print("Too obvious")
        }catch {
            print("Something went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func encryptString(str: String, withPassword password: String) throws -> String {
        // complicated encryption goes here
        
        guard password.characters.count > 0 else { throw EncryptionError.Empty }
        
        guard password.characters.count >= 5 else { throw EncryptionError.Short }
        
        guard password != "password" else { throw EncryptionError.Obvious }
        
        let encrypted = password + str + password
        
        return String(encrypted.characters.reverse())
    }

}

