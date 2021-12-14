//
//  AppDelegate.swift
//  MovieDiary
//
//  Created by Can Yoldas on 26.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()
        let tabBarController = MainTabBarBuilder.build()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}
