//
//  NavigationController.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, LoadingPresentable {
    
    var loadingController: LoadingViewController?
    
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
    }
}
