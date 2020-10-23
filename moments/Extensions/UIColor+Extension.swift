//
//  UIColor+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

import UIKit

extension UIColor {
    
    // MARK: - Custom colors
    
    /// HEX: #474A51
    class func darkGray() -> UIColor {
        UIColor(named: "darkGray") ?? white
    }
    
    /// HEX: #EFEFF4
    class func systemGray() -> UIColor {
        UIColor(named: "systemGray") ?? white
    }
}
