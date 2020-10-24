//
//  Int+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

extension Int {
    
    func countFriendly() -> String {
        let thousandNum = Double(self / 1000)
        let millionNum = Double(self / 1000000)
        
        if self >= 1000 && self < 1000000 {
            return "\(Int(thousandNum))k"
        }
        
        if self > 1000000 {
            if(floor(millionNum) == millionNum) {
                return "\(Int(thousandNum))k"
            }
            
            return "\(Int(millionNum))M"
        }
        
        if(floor(Double(self)) == Double(self)) {
            return "\(Int(self))"
        }
        
        return "\(self)"
    }
}
