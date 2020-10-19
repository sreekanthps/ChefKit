//
//  UINavigationHelper.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 16/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit

extension UIView {
    public func removeAllSubviewsAndRemoveFromSuperview() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }

        removeFromSuperview()
    }

    public func removeAllSubviews() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
    }
}
