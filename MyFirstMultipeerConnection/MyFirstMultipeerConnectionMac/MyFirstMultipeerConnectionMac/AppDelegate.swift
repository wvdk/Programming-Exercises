//
//  AppDelegate.swift
//  MyFirstMultipeerConnectionMac
//
//  Created by Wesley Van der Klomp on 5/6/19.
//  Copyright © 2019 wes. All rights reserved.
//

import Cocoa
import MultipeerConnectivity

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let serviceBrowser = MCNearbyServiceBrowser(peer: MCPeerID(displayName: "WesMac"), serviceType: "wes-testing-mpc")

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        serviceBrowser.delegate = self
        serviceBrowser.startBrowsingForPeers()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

extension AppDelegate: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Found peer with ID: \(peerID) and info: \(String(describing: info))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost peer with ID: \(peerID)")
    }
    
}

