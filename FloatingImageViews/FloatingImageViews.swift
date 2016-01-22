//
//  File.swift
//  animation-test
//
//  Created by Ilya Shaisultanov on 1/21/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import UIKit

class FloatingImageViews {
    private var _views: [UIView]
    private let _superview: UIView
    private let _imgName: String
    private let _speed: CGFloat
    private let _speed_variance: CGFloat
    private var _view_speeds: [CGFloat]
    
    init (superview: UIView, imageName: String, speed: Int = 10, speed_variance: Int = 20) {
        self._superview = superview
        self._imgName = imageName
        self._views = [UIView]()
        self._speed = CGFloat(speed)
        self._speed_variance = CGFloat(speed_variance)
        self._view_speeds = [CGFloat]()
    }
    
    func animate (numberOfViews: Int) {
        for i in 0...numberOfViews {
            let v = self._makeView(true)
            _views.append(v)
            _view_speeds.append(CGFloat(arc4random_uniform(UInt32(self._speed_variance))) + self._speed)
            _move(v, cb: self._cycle)
        }
    }
    
    private func _cycle (view: UIView) {
        view.removeFromSuperview()
        
        let i = self._views.indexOf(view)!
        
        self._views.removeAtIndex(i)
        
        let newV = self._makeView()
        
        self._views.insert(newV, atIndex: i)
        
        self._superview.addSubview(newV)
        
        //print("cycle! \(self._views.count), \(i)")
        
        self._move(newV, cb: self._cycle)
    }
    
    private func _makeView (attachToParent: Bool = false) -> UIView {
        let img = UIImage(named: self._imgName)
        
        let scale = CGFloat(arc4random_uniform(UInt32(7)) + 3) / 10.0
        let alpha = CGFloat(arc4random_uniform(UInt32(5) + 2)) / 10.0

        let width = img!.size.width * -1 * scale
        let height = img!.size.height * scale
        let x = CGFloat(0)
        let y = CGFloat(arc4random_uniform(UInt32(self._superview.frame.height)))
        let x_offset = CGFloat(arc4random_uniform(UInt32(100))) * -1
        let y_offset = CGFloat(arc4random_uniform(UInt32(height/2))) * -1

        
        let rect = CGRectMake(
            x + x_offset,
            y + y_offset,
            width,
            height
        )
        
        let view = UIImageView(frame: rect)
        view.image = img
        view.alpha = alpha
        
        if attachToParent {
            self._superview.addSubview(view)
        }
        
        return view
    }
    
    private func _move(v: UIView, cb: (v: UIView)->() = {_ in }){
        UIView.animateWithDuration(1, delay: 0, options: [.CurveLinear], animations: { () -> Void in
            let view_index = self._views.indexOf(v)!
            let speed = self._view_speeds[view_index]
            
            v.center.x += speed
            }) { (_) -> Void in
                if v.frame.origin.x < self._superview.frame.width {
                    self._move(v, cb: cb)
                } else {
                    cb(v: v)
                }
        }
    }
}