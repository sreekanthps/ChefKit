//
//  DashBoardMenuCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit

class DashBoardMenuCell: UICollectionViewCell {
    static let reuseIdentifier = "DashBoardMenuCell"
    fileprivate let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    func layoutViews() {
        backgroundColor = .white
        contentView.flex.define { (flex) in
            flex.addItem(button).height(70)
           
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(model: MenuModel?) {
        button.setTitle(model?.menuItem, for: .normal)
        setNeedsLayout()
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
        contentView.flex.layout(mode: .adjustWidth)
    }
}
