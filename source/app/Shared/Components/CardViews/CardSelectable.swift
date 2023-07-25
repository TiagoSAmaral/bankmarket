//
//  CardSelectable.swift
//
//  Created by Tiago Amaral on 18/06/23.
//  Copyright © 2023 developerios. All rights reserved.
//

import UIKit

class CardSelectable: UIView, CardStaticVisible {
    
    var action: ((Model?) -> Void)?
    var model: Model? {
        willSet {
            action = (newValue as? Selectable)?.actionOnTap
            makeTapEvent()
        }
    }
    
    func load(model: Model?) {
        fatalError("Must override this method")
    }
    
    func makeTapEvent() {
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(actionWhenTap))
        addGestureRecognizer(tapAction)
    }
    
    @objc func actionWhenTap() {
        action?(model)
    }
}
