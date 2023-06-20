//
//  LoadingManager.swift
//  hearthstonecardviewer
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol LoadingManagers where Self: UIViewController {
    func startLoading()
    func stopLoading(onFinish: (() -> Void)?)
}

extension LoadingManagers {
    func startLoading() {
        (navigationController as? LoadingPresentable)?.startLoading()
    }

    func stopLoading(onFinish: (() -> Void)?) {
        (navigationController as? LoadingPresentable)?.stopLoading(onFinish: onFinish)
    }
}
