//
//  CardTitleVview.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 24/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol CardTitleViewModel {
    var title: String? { get }
}

final class CardTitleView: UIView, CardStaticVisible {

    lazy var titleView: UILabel = {
        let title = UILabel()
        return title
    }()
    
    func load(model: Model?) {
        loadTitle(with: model)
        makeTitleViewLayout()
    }
    
    func loadTitle(with model: Model?) {
        guard let viewModel = model as? CardTitleViewModel,
              let stringValue = viewModel.title else {
            return
        }
        
        defineTitle(with: stringValue)
    }
    
    func defineTitle(with stringValue: String) {
        
        let fullTextAttributedMutable = NSMutableAttributedString(string: stringValue)
        let rangeFullText = fullTextAttributedMutable.mutableString.range(of: fullTextAttributedMutable.string)
        let words = stringValue.components(separatedBy: .whitespaces)
        
        // first word
        if let firstWord = words.first {
            let rangeFirstWord = fullTextAttributedMutable.mutableString.range(of: firstWord)
            fullTextAttributedMutable.addAttribute(.foregroundColor,
                                                   value: ColorAssets.titleColor ?? UIColor.blue,
                                                   range: rangeFirstWord)
        }
        
        // second word
        if words.count > 1, let secondWord = words.last {
            let secondWordWord = fullTextAttributedMutable.mutableString.range(of: secondWord)
            fullTextAttributedMutable.addAttribute(.foregroundColor,
                                                   value: ColorAssets.descriptionColor ?? UIColor.lightGray,
                                                   range: secondWordWord)
        }
        
        fullTextAttributedMutable.addAttribute(.font,
                                               value: FontPallet.mainFontBold16,
                                               range: rangeFullText)
        
        titleView.attributedText = fullTextAttributedMutable
    }
    
    func makeTitleViewLayout() {
        addSubviews([titleView])
        titleView.leadingToSuperview()
        titleView.trailingToSuperview()
        titleView.height(30)
        titleView.centerY(of: self)
    }
}
