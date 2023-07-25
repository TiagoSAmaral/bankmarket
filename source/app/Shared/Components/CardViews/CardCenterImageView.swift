//
//  CardCenterImageView.swift
//  bankmarketTarget
//
//  Created by Tiago Amaral on 24/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit
import Kingfisher

protocol CardCenterImageViewModel {
    var bannerURL: String? { get }
}

final class CardCenterImageView: CardSelectable {
    
    let scaleFactorImageSize: CGFloat = 0.35
    let scaleFactorDropShadoSize: CGFloat = 0.7
    let conerRadius: CGFloat = 16.0
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.layer.cornerRadius = conerRadius
        shadowView.backgroundColor = .white
        return shadowView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func load(model: Model?) {
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

        guard let viewModel = model as? Visible else {
            return
        }
        
        let size = (viewModel.height ?? .zero) * scaleFactorImageSize

        addSubviews([imageView])
        imageView.height(size).width(size)
        imageView.centerY(of: self)
        imageView.centerX(of: self)
    }
    
    func makeShadowViewLayout(model: Model?) {

        guard let viewModel = model as? Visible else {
            return
        }

        let size = (viewModel.height ?? .zero) * scaleFactorDropShadoSize

        addSubviews([shadowView])

        bringSubviewToFront(imageView)
        shadowView.height(size).width(size)
        shadowView.centerX(of: self)
        shadowView.centerY(of: self)
        shadowView.dropShadow()
    }
}
