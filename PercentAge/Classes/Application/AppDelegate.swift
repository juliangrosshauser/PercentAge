//
//  AppDelegate.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Properties

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        window.rootViewController = NavigationController(rootViewController: AgeViewController())

        return window
    }()

    //MARK: UIApplicationDelegate

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // make UINavigationBar transparent
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
        UINavigationBar.appearance().shadowImage = UIImage()

        UINavigationBar.appearance().tintColor = .whiteColor()

        self.window?.makeKeyAndVisible()

        return true
    }
}

