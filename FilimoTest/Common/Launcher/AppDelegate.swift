//
//  AppDelegate.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupKeyboard()
        return true
    }
    
    func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = ColorPalette.keyboardDoneColor
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 80
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

