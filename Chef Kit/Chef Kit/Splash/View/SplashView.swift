//
//  SplashView.swift
//  Chef Kit
//
//  Created by Swetha Sreekanth on 16/10/20.
//  Copyright © 2020 Brewers. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout
import Lottie

class SplashView: UIView {
    enum Action: DelegateAction {
       case AnimationComplete
       
    }
    weak var delegate: ActionDelegate?
    var lottieView: AnimationView!
    private let root: UIView = UIView()
      
    let image : UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "launchimage")
        return image
    }()
    init() {
       lottieView = AnimationView(name: "fooddelivery", bundle: Bundle.main)
       super.init(frame: .zero)
       configure()
       loadView()
    }
    func configure() {
       lottieView.loopMode = .repeat(3)
       lottieView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       lottieView.contentMode = .scaleToFill
       lottieView.clipsToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    func startLoadAnimation() {
        lottieView.play { (completed) in
            // Imform main scree
            self.delegate?.actionSender(didReceiveAction: Action.AnimationComplete)
        }
    }
    func loadView() {
        removeAllSubviewsAndRemoveFromSuperview()
        root.flex.define { (flex) in
            flex.addItem(image).width(100%).height(100%).justifyContent(.center).alignItems(.center).define { (flex) in
                flex.addItem(lottieView).size(200).alignSelf(.center)
           }
            
        }
        addSubview(root)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        root.pin.all()
        
        // Then let the flexbox container layout itself
        root.flex.layout()
    }
}
