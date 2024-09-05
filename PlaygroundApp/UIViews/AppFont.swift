//
//  AppFont.swift
//  PlaygroundApp
//
//  Created by Leonardo Kiszewski on 04/09/24.
//

import UIKit

extension UIFont {
    private enum CustomFont: String {
        case regular = "PlaywriteCU-Regular"
        case light = "PlaywriteCU-Light"
        case extraLight = "PlaywriteCU-ExtraLight"
        case thin = "PlaywriteCU-Thin"
    }
    
    static func appFontRD(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
            var font = UIFont(name: CustomFont.regular.rawValue, size: size)
            switch weight {
            case .ultraLight:
                font = UIFont(name: CustomFont.extraLight.rawValue, size: size)
            case .thin:
                font = UIFont(name: CustomFont.thin.rawValue, size: size)
            case .light:
                font = UIFont(name: CustomFont.light.rawValue, size: size)
            case .regular:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            case .medium:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            case .semibold:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            case .bold:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            case .heavy:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            case .black:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            default:
                font = UIFont(name: CustomFont.regular.rawValue, size: size)
            }
            guard let retValue = font else {
                return .systemFont(ofSize: size, weight: weight)
            }
            return retValue
        }
}

class AppFont {
    static var shared = AppFont()
    
    func custom(of size: CGFloat, of weight: UIFont.Weight) -> UIFont {
        UIFont.appFontRD(ofSize: size, weight: weight)
    }
}
