//
//  CardDumpDetail.swift
//  bankmarket
//
//  Created by Tiago Amaral on 25/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol CardDumpDetailViewModel {
    var title: String? { get }
    var description: String? { get }
}

final class CardDumpDetailView: UIView, CardStaticVisible {

    lazy var titleView: UILabel = {
        let title = UILabel()
        title.textColor = ColorAssets.titleColor
        return title
    }()
    
    lazy var descriptionView: UILabel = {
        let descriptionView = UILabel()
        descriptionView.numberOfLines = .zero
        descriptionView.textColor = .white // ColorAssets.descriptionColor
        return descriptionView
    }()
    
    func load(model: Model?) {
        loadTitle(with: model)
        defineTitle(with: model)
        makeTitleViewLayout()
        makeDescriptionViewLayout()
    }
    
    func loadTitle(with model: Model?) {
        defineTitle(with: model)
        defineDescription(with: model)
    }
    
    func defineTitle(with model: Model?) {
        
        guard let viewModel = model as? CardDumpDetailViewModel,
              let stringValue = viewModel.title else {
            return
        }
        titleView.text = stringValue
    }
    
    func defineDescription(with model: Model?) {
        
        guard let viewModel = model as? CardDumpDetailViewModel,
              let stringValue = viewModel.description else {
            return
        }
        if var attributedText = stringValue.htmlToAttributedString {
            let rangeFullText = attributedText.mutableString.range(of: attributedText.string)
            
            attributedText.addAttribute(.foregroundColor,
                                        value: ColorAssets.descriptionColor,
                                                   range: rangeFullText)
            attributedText.addAttribute(.font,
                                        value: FontPallet.descriptionFont,
                                        range: rangeFullText)
            descriptionView.attributedText = attributedText
        } else {
            descriptionView.text = stringValue
        }
    }
    
    func makeTitleViewLayout() {
        addSubviews([titleView])
        titleView.leadingToSuperview()
        titleView.trailingToSuperview()
        titleView.height(30)
        titleView.topToSuperview()
    }
    
    func makeDescriptionViewLayout() {
        addSubviews([descriptionView])
        descriptionView.leadingToSuperview()
        descriptionView.trailingToSuperview()
        descriptionView.topToBottom(of: titleView, margin: 8)
    }
}
