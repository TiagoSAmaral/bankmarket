//
//  ProfileView.swift
//  bankmarket
//
//  Created by Tiago Amaral on 25/07/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit
import Kingfisher

protocol ProfileViewer where Self: UIView {
    func load(model: Model?)
}

protocol ProfileViewModel where Self: Model {
    var titleValue: String? { get }
    var profileImage: String? { get }
}

final class ProfileView: UIView, ProfileViewer {
    
    let imageSize: CGFloat = 30.0
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        return imageView
    }()
    
    lazy var titleView: UILabel = {
        let titleView = UILabel()
        titleView.font = FontPallet.mainLight16
        titleView.textColor = ColorAssets.titleColor
        return titleView
    }()

    func load(model: Model?) {
        
        loadImage(with: model)
        loadTitle(with: model)
        
        makeLayoutOfProfileView()
        makeLayoutOfProfileView()
        makeImageViewLayout()
        makeTitleViewLayout()
    }
    
    func loadImage(with model: Model?) {
        imageView.kf.setImage(with: URL(string: (model as? ProfileViewModel)?.profileImage ?? .empty), placeholder: UIImage(named: "placeholderProfile"))
    }
    
    func loadTitle(with model: Model?) {
        guard let model = model as? ProfileViewModel,
              let value = model.titleValue else {
            return
        }
        titleView.text = LocalizedText.with(tagName: .helloPresentation).appending("\(value)")
    }
    
    func makeLayoutOfProfileView() {
        height(44).width(UIScreen.main.bounds.width)
    }
    
    func makeImageViewLayout() {
        addSubviews([imageView])
        imageView.height(imageSize).width(imageSize)
        imageView.leadingToSuperview(margin: 8)
        imageView.centerY(of: self)
    }
    
    func makeTitleViewLayout() {
        addSubviews([titleView])
        titleView.height(25)
        titleView.leadingToTrailing(of: imageView, margin: 8)
        titleView.trailingToSuperview(margin: 8)
        titleView.centerY(of: self)
    }
}
