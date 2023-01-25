//
//  ViewController.swift
//  ARTest
//
//  Created by 李泽禹 on 2022/12/15.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    var tankAnchor : TinyToyTank._TinyToyTank?
    var isActionPlaying : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        
        arView.scene.anchors.append(tankAnchor!)
        tankAnchor?.actions.actionComplete.onAction = { _ in
            self.isActionPlaying = false
        }
    }
    
    
    @IBAction func tankRight(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.tankRight.post()
    }
    
    
    @IBAction func tankLeft(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.tankLeft.post()
    }
    
    
    @IBAction func tankForward(_ sender: Any) {
       
        tankAnchor!.turret?.setParent(tankAnchor!.tank,preservingWorldTransform: true)
        tankAnchor!.notifications.tankForward.post()
    }
    
    
    @IBAction func turretRight(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func turretLeft(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func cannonFire(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.cannonFire.post()
    }
    
    
    
}
