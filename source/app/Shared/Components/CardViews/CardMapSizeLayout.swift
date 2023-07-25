//
//  CardMapLaytou.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

enum CardMapSizeLayout {
    
    static func defineSize(of typeLayout: CardLayoutView?) -> (CGFloat, CGFloat)? {
        guard let typeLayout = typeLayout else {
            return nil
        }
        
        return (getHeight(to: typeLayout), getWidth(to: typeLayout))
    }
    
    private static func getHeight(to layoutView: CardLayoutView) -> CGFloat {
        switch layoutView {
        case .bannerScrollableView:
            return 160.0
        case .bannerCardView:
            return 140.0
        case .cashDigioScrollableView, .cashDigioCardView:
            return 90.0
        case .productScrollableView, .productCardView:
            return 120.0
        case .titleCardView:
            return 44.0
        }
    }
    
    private static func getWidth(to layoutView: CardLayoutView) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 20.0
        switch layoutView {
        case .bannerScrollableView, .cashDigioScrollableView, .productScrollableView, .titleCardView:
            return screenWidth
        case .bannerCardView, .cashDigioCardView:
            return 315.0
        case .productCardView:
            return 95.0
        }
    }
}
