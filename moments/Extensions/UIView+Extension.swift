//
//  UIView+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

extension UIView {
    
    @discardableResult public func fillSuperview() -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return self }
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        
        return self
    }
}
