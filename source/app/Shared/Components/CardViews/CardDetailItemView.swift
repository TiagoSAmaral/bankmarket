//
//  CardDetailItem.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit
import Kingfisher

final class CardDetailItemView: CardSelectable {
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.height(510)
        return imageView
    }()
    
    override func load(model: Model?) {
        self.model = model
        let visibleModel = model as? Item
        if let imagePath = visibleModel?.image, let urlPath = URL(string: imagePath) {
            imageView.kf.setImage(with: urlPath)
        }
        layoutVStackView()
        layoutImageView()
        defineTextDetailOfItem()
    }
    
    func layoutVStackView() {

        addSubviews([vStackView])
        vStackView.edgeToSuperView()
    }
    
    func layoutImageView() {

        vStackView.addArrangedSubview(imageView)
//        imageView.height(510)
    }
    
    func defineTextDetailOfItem() {

        guard let visibleModel = model as? Item else {
            return
        }
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .nameText)): \(visibleModel.name ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(visibleModel.text?.htmlToString ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .setText)): \(visibleModel.cardSet?.name ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .rarityText)): \(visibleModel.rarity?.name ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .atackText)): \(visibleModel.attack ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .costText)): \(visibleModel.manaCost ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .healthText)): \(visibleModel.health ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(visibleModel.flavorText?.htmlToString ?? .empty)"))
    }
    
    func makeLabel(with text: String) -> UIView {
        
        let baseView = UIView()
        let label = UILabel()
        baseView.height(44)
        baseView.addSubviews([label])
        label.centerX(of: baseView).centerY(of: baseView).edgeToSuperViewHorizontal(margin: 16)
        
        label.font = FontPallet.mainFont?.withSize(16)
        label.text = text
        label.numberOfLines = .zero
        label.textColor = ColorAssets.attributesColor
        return baseView
    }
}
