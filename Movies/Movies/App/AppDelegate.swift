//
//  AppDelegate.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ServiceNetworkReachability.shared.startNetworkMonitoring()

        
        app.router.start()

//        app.router.start()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("DEEPLINK: \(url)")
        return true
    }




}

