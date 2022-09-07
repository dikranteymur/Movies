//
//  AppRouter.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class AppRouter {
    let window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }

    func start() {
        let navigationController = MainScreenBuilder.make()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func detailView() {
        let viewController = DetailScreenBuilder.make()
        let nav = UINavigationController(rootViewController: viewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
