//
//  ViewController.swift
//  SCNCustomGeometries
//
//  Created by Max Cobb on 28/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
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
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene

		let light = SCNLight()
		light.type = .omni
		let lightNode = SCNNode()
		lightNode.light = light
		sceneView.pointOfView?.addChildNode(lightNode)

		let newNode = SCNNode(geometry: SCNGeometry.SkewBox(width: 0.2, height: 0.2, length: 0.2, skewTop: CGPoint(x: 0.1, y: 0.2)))
		newNode.position.z = -1
//		newNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "labyrinth_marker")
		sceneView.scene.rootNode.addChildNode(newNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
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
