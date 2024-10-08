//
//  RedRectAnimatedUIView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 28/08/24.
//

import UIKit

class RedRectViewController : UIViewController {
    let redRectView = UIView()
    let buttonView = UIKitPlaygroundButton()
    
    let _width: CGFloat = 120
    let _height: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        redRectView.backgroundColor = .systemRed
        view.addSubview(redRectView)
        
        buttonView.setTitle("Tap me", for: .normal)
        buttonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(buttonView)
        
    }
    
    @objc func buttonTapped(sender : UIButton) {
        print("Tapped Button 1")
        scaleUp()
        print("Tapped Button 2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let centerX = view.bounds.midX
        let centerY = view.bounds.midY
        
        redRectView.frame = CGRect(x: centerX - _width / 2, y: centerY - _height / 2, width: _width, height: _height)
        buttonView.frame = CGRect(x: centerX - _width / 2, y: 32, width: _width, height: 48)
        
        scaleUp()
    }
    
    func moveRight() {
        let animation = CABasicAnimation()
        
        let centerX = view.bounds.midX
        let centerY = view.bounds.midY
        
        animation.keyPath = "position.x"
        animation.fromValue = centerX
        animation.toValue = centerX + 30
        animation.duration = 1
        
        redRectView.layer.add(animation, forKey: "basic")
        redRectView.layer.position = CGPoint(x: centerX + 30, y: centerY)   // Important to define the final position to the View
    }
    
    func scaleUp() {
        let animation = CABasicAnimation()
        
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2 // Double the size
        animation.duration = 1.5
        
        redRectView.layer.add(animation, forKey: "basic")
        redRectView.layer.transform = CATransform3DMakeScale(2, 2, 1)
    }
    
    func rotate() {
        
    }
}
