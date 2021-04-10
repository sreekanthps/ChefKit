//
//  MenuOptionsCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 10/4/21.
//  Copyright © 2021 Brewers. All rights reserved.
//

import Foundation
import UIKit

class MenuOptionsCell: UICollectionViewCell {
    static let reuseIdentifier = "MenuOptionsCell"
    
    private var menuButton: UIButton {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        button.contentHorizontalAlignment = .center
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutViews() {
        backgroundColor = .white
        contentView.flex.define { (flex) in
            flex.addItem(menuButton).marginVertical(10).marginHorizontal(20)
        }
    }
   	 
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size
    }
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
}
