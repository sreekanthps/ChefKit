//
//  MenuItemCell.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 19/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class MenuItemCell: UITableViewCell {
    static let reuseIdentifier = "MenuItemCell"
    let rounderView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    let imgView: UIImageView = {
         let imgView = UIImageView(frame: .zero)
         imgView.contentMode = .scaleAspectFit
         imgView.image = UIImage(named: "photography")
         return imgView
     }()
     let itemName: UILabel = {
         let label = UILabel(frame: .zero)
         label.numberOfLines = 1
         label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
         return label
     }()
      var itemDesc: UILabel = {
         let label = UILabel(frame: .zero)
         label.numberOfLines = 2
         label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
         label.textColor = UIColor.hexColor(Colors.bc3)
         return label
     }()
     
     let itemDetails: UILabel = {
         let label = UILabel(frame: .zero)
         label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
         label.textColor = UIColor.hexColor(Colors.bc5)
         return label
     }()
     
    private var addtoCart: UIButton {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        
        return button
    }
     
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         layoutViews()
     }
     
     func layoutViews() {
         self.contentView.flex.define { (flex) in
            flex.addItem(rounderView).marginHorizontal(20).marginVertical(10).define { (flex) in
                flex.addItem(imgView).height(350).width(100%)
                flex.addItem(itemName).marginTop(20).marginHorizontal(20)
                flex.addItem(itemDesc).marginTop(20).marginHorizontal(20)
                flex.addItem().direction(.row).marginTop(20).marginHorizontal(20).marginBottom(20).justifyContent(.spaceBetween).define { (flex) in
                    flex.addItem(itemDetails)
                    flex.addItem(addtoCart).height(40).width(110)
                }
            }
          }
     }
     
    func configureData(data: MenuItemsModel) {
        imgView.image = UIImage(named: data.image ?? "pizza")
        itemName.text = data.title
        itemDesc.text = data.description
        itemDetails.text = data.contents
        addtoCart.setTitle(data.price, for: .normal)
        setNeedsLayout()
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        return nil
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 1) Set the contentView's width to the specified size parameter
        contentView.pin.width(size.width)
        
        // 2) Layout contentView flex container
        layout()
        
        // Return the flex container new size
        return contentView.frame.size
    }
}
