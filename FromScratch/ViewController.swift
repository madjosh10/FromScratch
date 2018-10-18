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
        sceneView.debugOptions = [.showFeaturePoints]
        
        if let scene = SCNScene(named: "art.scnassets/ship.scn") {
            sceneView.scene = scene
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
        
    }
    
    

}

