//
//  MosaicBaseView.swift
//  BaseProjectTarget
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class MosaicBaseView {
    
    lazy var baseView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    init() {
        makeConstraint()
    }
    
    func insertNew(view: UIView) {
        vStackView.addArrangedSubview(view)
    }
    
    func makeConstraint() {
        baseView.addSubviews([vStackView])
        vStackView.edgeToSuperView()
    }
}
