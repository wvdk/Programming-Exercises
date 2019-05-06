//
//  ViewController.swift
//  MyFirstMultipeerConnectioniOS
//
//  Created by Wesley Van der Klomp on 5/6/19.
//  Copyright © 2019 wes. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let serviceBrowser = MCNearbyServiceBrowser(peer: MCPeerID(displayName: "WesMac"), serviceType: "wes-testing-mpc")
        serviceBrowser.delegate = self
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Found peer with ID: \(peerID) and info: \(info)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost peer with ID: \(peerID)")
    }
    
    
    
}
