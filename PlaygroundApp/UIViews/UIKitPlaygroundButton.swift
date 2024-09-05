//
//  PlaygroundButtonUIKit.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 04/09/24.
//

import UIKit

class UIKitPlaygroundButton : UIButton {
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private var defaultStyle: ButtonState = .primary
    
    var isLoading: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        self.titleLabel?.font = AppFont.shared.custom(of: 16, of: .bold)
        self.layer.cornerRadius = 2.0
        self.setStyleState(self.defaultStyle)
        
        // Indicator
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func updateView() {
        if isLoading {
            activityIndicator.startAnimating()
            self.titleLabel?.alpha = 0
            self.titleLabel?.layer.opacity = 0
            self.imageView?.alpha = 0
            self.titleLabel?.isHidden = true
            self.titleLabel?.textColor = UIColor.clear
            isEnabled = false
        } else {
            activityIndicator.stopAnimating()
            self.titleLabel?.alpha = 1
            self.titleLabel?.layer.opacity = 1
            self.imageView?.alpha = 1
            self.titleLabel?.textColor = UIColor.white
            self.titleLabel?.isHidden = false
            isEnabled = true
        }
    }
    
    func setStyleState(_ state: ButtonState) {
        if state == .primary {
            self.setTitleColor(UIColor.white, for: .normal)
            self.backgroundColor = UIColor.black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.5
            self.defaultStyle = .primary
        } else {
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = UIColor.white
            self.defaultStyle = .secondary
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
}

enum ButtonState {
    case primary
    case secondary
}
