//
//  UIKitExtension.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
            let maskPath1 = UIBezierPath(roundedRect: bounds,
                                         byRoundingCorners: corners,
                                         cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
        }
}
