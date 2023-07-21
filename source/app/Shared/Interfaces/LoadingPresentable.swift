//
//  LoadingPresentable.swift
//  bankmarket
//
//  Created by Tiago Amaral on 20/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

protocol LoadingPresentable where Self: UIViewController {
    
    var loadingController: LoadingViewController? { get set }
    func startLoading()
    func stopLoading(onFinish: (() -> Void)?)
}

extension LoadingPresentable {
    
    func startLoading() {
        loadingController = LoadingViewController()
        loadingController?.modalPresentationStyle = .overCurrentContext
        loadingController?.modalTransitionStyle = .crossDissolve
        if let loadingController = loadingController {
            present(loadingController, animated: true, completion: nil)
        }
    }
    
    func stopLoading(onFinish: (() -> Void)?) {
        guard let loadingController = loadingController else {
            onFinish?()
            return
        }
        
        loadingController.dismiss(animated: true) {
            onFinish?()
            self.loadingController = nil
        }
    }
}
