//
//  UIKitPlaygroundView.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 28/08/24.
//

import SwiftUI

struct UIKitPlaygroundView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RedRectViewController {
        return RedRectViewController()
    }
    
    func updateUIViewController(_ uiViewController: RedRectViewController, context: Context) {
    
    }
    
    typealias UIViewControllerType = RedRectViewController
}

#Preview {
    UIKitPlaygroundView()
}
