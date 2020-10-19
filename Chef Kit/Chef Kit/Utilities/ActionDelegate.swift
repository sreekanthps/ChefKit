//
//  ActionDelegate.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 16/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import Foundation

public protocol DelegateAction {}
public protocol ActionDelegate: class {
    func actionSender(didReceiveAction action: DelegateAction)
}
