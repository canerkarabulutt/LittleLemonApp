//
//  AppDelegate.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MenuItemsViewController())
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

}

