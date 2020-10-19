//
//  PromotionCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class PromotionCell: UICollectionViewCell {
    static let reuseIdentifier = "PromotionCell"
    fileprivate let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
        
    }()
    fileprivate let headerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
        
    }()
    fileprivate let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
        
    }()
    
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
            flex.addItem(titleLabel).marginTop(40).marginHorizontal(20)
            flex.addItem(headerLabel).marginTop(70).marginHorizontal(100)
            flex.addItem(textLabel).marginTop(10).marginHorizontal(70)
        }
    }
    func configure(model: PromotionModel) {
        titleLabel.text = model.smallHeader
        titleLabel.flex.markDirty()
        headerLabel.text = model.bigHeader
        headerLabel.flex.markDirty()
        textLabel.text = model.desciptionText
        textLabel.flex.markDirty()
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
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    
}
