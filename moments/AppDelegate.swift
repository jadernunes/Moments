//
//  AppDelegate.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Attributes
    
    var window: UIWindow?
    
    // MARK: - Life cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppCoordinator.start()
        
        return true
    }
}
