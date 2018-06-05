//
//  ViewController.swift
//  Whats New in ARKit
//
//  Created by Wesley Van der Klomp on 6/5/18.
//  Copyright © 2018 wes. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
//        sceneView.session.run(configuration)
//
        let session = sceneView.session
//
//        session.getCurrentWorldMap { (worldMap, error) in
//            guard let worldMap = worldMap else {
//
//                return
//            }
//        }
//
//        configuration.environmentTexturing = .automatic // enables the room's cube map (mtltexture) saving and background hallucination
//        // If set to .manual you can add your own manually
//
//        session.run(configuration)
//
//
//
//
//
//
//
//        // Note:
//        // world tracking status - available on ARFrame
//
        
        
        
        
        
        
        
        
        
        // Image Detection (added in 1.5)
        
        // Recognition of know static 2D  images
        // You can add these images it should detect to xcassets (or in the bumdle and add them at runtime)
        
        
        // File/Asset > ARReferenceImage > ARImageTrackingConfiguration > ARSession
        
        
        // ARImageAnchor
        // isTracked
        
        // Lot of images and shapes are easier to recognize
        // XCode assets will give a warning if it's not good
        
        
        let configuration = ARImageTrackingConfiguration()
        
        configuration.trackingImages = []
        configuration.maximumNumberOfTrackedImages = 2
        session.run(configuration)
        
        
        // I think you can use either ARImageTrackingConfiguration or ARWOrldTracking and set them both up to do Image Tracking
        
        
        
        
        // Then we also have Object Detection (for 3D objects)
        
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
