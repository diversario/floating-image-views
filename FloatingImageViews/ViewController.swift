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
        let fl = FloatingImageViews(
            superview: self.view,
            imageName: "rain",
            speed: 100,
            speed_variance: 300
        )
        fl.animate(10)
    }
}

