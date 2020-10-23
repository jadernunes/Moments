//
//  AppCoordinator.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Attributes
    
    static var window: UIWindow? = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.window
    }()
    
    // MARK: - Navigations
    
    static func start() {
        let navigation = UINavigationController()
        let coordinator = HomeCoordinator(presenter: navigation)
        coordinator.start()
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
