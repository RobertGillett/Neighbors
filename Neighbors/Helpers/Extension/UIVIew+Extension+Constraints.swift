//
//  UIVIew+Extension+Constraints.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func constrainToParent() {
        constrainToParent(insets: .zero)
    }
    
    func constrainToParent(insets: UIEdgeInsets) {
        guard let parent = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        let metrics: [String : Any] = ["left" : insets.left, "right" : insets.right, "top" : insets.top, "bottom" : insets.bottom]
        
        parent.addConstraints(["H:|-(left)-[view]-(right)-|", "V:|-(top)-[view]-(bottom)-|"].flatMap {
            NSLayoutConstraint.constraints(withVisualFormat: $0, metrics: metrics, views: ["view": self])
        })
    }
    func constrainToBottom(insets: UIEdgeInsets? = .zero) {
        guard let parent = superview else { return }
        guard let insets = insets else {return}

        translatesAutoresizingMaskIntoConstraints = false
        let metrics: [String : Any] = ["left" : insets.left, "right" : insets.top, "bottom" : insets.bottom]

        parent.addConstraints(["H:|-(left)-[view]-(right)-|", "V:|-[view(60)]-(bottom)-|"].flatMap {
            NSLayoutConstraint.constraints(withVisualFormat: $0, metrics: metrics, views: ["view": self])
        })
    }
}
