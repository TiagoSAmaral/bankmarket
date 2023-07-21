//
//  CardDetailItem.swift
//
//  Created by Tiago Amaral on 17/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit
import Kingfisher

protocol CardDetailItemViewModel {
    var cardTitle: String? { get }
    var cardImageUrl: String? { get }
    var cardFullText: String? { get } // text
    var cardCardSetText: String? { get } // cardSet?.name
    var cardRarityText: String? { get } // rarity?.name
    var cardAttackNumber: Int? { get } // attack
    var cardManaCostNumber: Int? { get } // manaCost
    var cardHealthNumber: Int? { get } // health
    var cardFlavorText: String? { get } // flavorText
}

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
        let visibleModel = model as? CardDetailItemViewModel
        if let imagePath = visibleModel?.cardImageUrl, let urlPath = URL(string: imagePath) {
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
    }
    
    func defineTextDetailOfItem() {

        guard let visibleModel = model as? CardDetailItemViewModel else {
            return
        }
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .nameText)): \(visibleModel.cardTitle ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(visibleModel.cardFullText?.htmlToString ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .setText)): \(visibleModel.cardCardSetText ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .rarityText)): \(visibleModel.cardRarityText ?? .empty)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .attackText)): \(visibleModel.cardAttackNumber ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .costText)): \(visibleModel.cardManaCostNumber ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(LocalizedText.with(tagName: .healthText)): \(visibleModel.cardHealthNumber ?? .zero)"))
        vStackView.addArrangedSubview(makeLabel(with: "\(visibleModel.cardFlavorText?.htmlToString ?? .empty)"))
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
