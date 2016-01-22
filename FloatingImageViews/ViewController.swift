//
//  ViewController.swift
//  FloatingImageViews
//
//  Created by Ilya Shaisultanov on 1/21/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        let fl1 = FloatingImageViews(
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
        
        let fl2 = FloatingImageViews(
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
        
        let fl3 = FloatingImageViews(
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

