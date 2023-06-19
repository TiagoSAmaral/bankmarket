//
//  NavigationController.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol NavigationControllerDecorable {
    func defineNavigationBarTitleViewWith(imageName: String)
}

class NavigationController: UINavigationController, NavigationControllerDecorable {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        defineApperance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defineApperance()
    }
    
    private func fixBartintColoriOS15() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorAssets.cardBackgroundColor
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
    }

    func defineApperance() {
        navigationBar.isTranslucent = false
        fixBartintColoriOS15()
        defineBackbuttonApperance()
    }
    
    func defineBackbuttonApperance() {
        navigationBar.barTintColor = ColorAssets.cardBackgroundColor
    }
    
    func defineNavigationBarTitleViewWith(imageName: String) {
        if self.navigationItem.titleView == nil,
           let image = UIImage(named: imageName) {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            viewControllers.first?.navigationItem.titleView = imageView
            navigationBar.setTitleVerticalPositionAdjustment(-5, for: UIBarMetrics.default)
        }
    }
}
