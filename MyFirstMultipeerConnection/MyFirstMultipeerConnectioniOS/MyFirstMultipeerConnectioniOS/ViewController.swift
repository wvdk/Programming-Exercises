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

    let serviceBrowser = MCNearbyServiceBrowser(peer: MCPeerID(displayName: "WesiOS"), serviceType: "wes-testing-mpc")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceBrowser.delegate = self
        serviceBrowser.startBrowsingForPeers()
        
    }


}

extension ViewController: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Found peer with ID: \(peerID) and info: \(String(describing: info))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost peer with ID: \(peerID)")
    }
    
    
    
}
