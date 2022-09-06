//
//  MainScreenBuilder.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class MainScreenBuilder {
    static func make() -> UINavigationController {
        let viewController = BaseScreenViewController(nibName: BaseScreenViewController.className, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
