//
//  ButtonReload.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import UIKit

final class ButtonReload: UIButton {
    
    // MARK: - Life cycle
    
    init() {
        super.init(frame: .infinite)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        setImage(UIImage(named: "refresh"), for: .normal)
        tintColor = .darkGray()
    }
}
