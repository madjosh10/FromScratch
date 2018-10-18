//
//  ViewController.swift
//  FromScratch
//
//  Created by Joshua Madrigal on 10/18/18.
//  Copyright © 2018 Joshua Madrigal. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        sceneView.autoenablesDefaultLighting = true
        
        let cube = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0.0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue
        cube.materials = [material]
        
        let cubeNode = SCNNode()
        cubeNode.geometry = cube
        cubeNode.position = SCNVector3(0.0, 0.0, -3.0)
        
        let rotation = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 2)
        let repeatRotation = SCNAction.repeatForever(rotation)
        cubeNode.runAction(repeatRotation)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    

} // end ViewController Class

