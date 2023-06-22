//
//  AppDelegate.swift
//  hearthstonecardviewer
//
//  Created on 23/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		window = UIWindow(frame: UIScreen.main.bounds)
        SceneStarter.makeScene(into: window)
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let security = Security(keychainAccess: KeychainAccess())
        security.deleteToken()
    }
}
