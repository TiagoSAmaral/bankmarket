//
//  CardFullImageView.swift
//  bankmarket
//
//  Created by Tiago Amaral on 21/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit
import Kingfisher

protocol CardFullImageViewModel {
    var bannerURL: String? { get }
}

final class CardFullImageView: CardSelectable {

    let scaleFactorDropShadoSize: CGFloat = 1.0
    let conerRadius: CGFloat = 16.0
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.layer.cornerRadius = conerRadius
        return shadowView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // .scaleAspectFit
        imageView.layer.cornerRadius = conerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func load(model: Model?) {
        self.model = model
        loadImage(model: model)
        makeImageViewLayout(model: model)
        makeShadowViewLayout(model: model)
    }
    
    func loadImage(model: Model?) {
        guard let viewModel = model as? CardFullImageViewModel,
              let stringPath = viewModel.bannerURL,
              let urlPath = URL(string: stringPath) else {
            return
        }
        imageView.kf.setImage(with: urlPath, placeholder: UIImage(named: "noImage"))
    }
    
    func makeImageViewLayout(model: Model?) {
        guard let viewModel = model as? Visible, let heightValue = viewModel.height else {
            return
        }

        addSubviews([imageView])
        imageView.leadingToSuperview()
        imageView.trailingToSuperview()
        imageView.height(heightValue ?? .zero)
        imageView.centerY(of: self)
    }
    
    func makeShadowViewLayout(model: Model?) {

        guard let viewModel = model as? Visible else {
            return
        }

        addSubviews([shadowView])

        bringSubviewToFront(imageView)
        shadowView.height(viewModel.height ?? .zero).width(viewModel.width ?? .zero)
        shadowView.centerX(of: self)
        shadowView.centerY(of: self)
        shadowView.dropShadow()
    }
}
