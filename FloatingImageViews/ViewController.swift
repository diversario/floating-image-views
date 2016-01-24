//
//  ViewController.swift
//  FloatingImageViews
//
//  Created by Ilya Shaisultanov on 1/21/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fl1: FloatingImageViews!
    var fl2: FloatingImageViews!
    var fl3: FloatingImageViews!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        clouds()
    }
    
    
    @IBAction func button(sender: UIButton) {
        clouds()
    }
    
    func clouds () {
        if let f1 = fl1, f2 = fl2, f3 = fl3 {
            f1.fadeAndStop()
            f2.fadeAndStop()
            f3.fadeAndStop()
        }
        
        fl1 = FloatingImageViews(
            superview: self.view,
            imageName: "cloud1",
            speedBase: 30,
            speedVariance: 3,
            alphaBase: 0.1,
            alphaVariance: 1.5,
            scaleBase: 1,
            scaleVariance: 2
        )
        fl1.animate(6)
        
        fl2 = FloatingImageViews(
            superview: self.view,
            imageName: "cloud2",
            speedBase: 30,
            speedVariance: 3,
            alphaBase: 0.1,
            alphaVariance: 1.5,
            scaleBase: 1,
            scaleVariance: 2
        )
        fl2.animate(6)
        
        fl3 = FloatingImageViews(
            superview: self.view,
            imageName: "cloud3",
            speedBase: 30,
            speedVariance: 3,
            alphaBase: 0.1,
            alphaVariance: 1.5,
            scaleBase: 1,
            scaleVariance: 2
        )
        fl3.animate(6)
    }
}

