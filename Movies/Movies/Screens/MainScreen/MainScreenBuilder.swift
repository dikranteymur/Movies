//
//  MainScreenBuilder.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class MainScreenBuilder {
    static func make() -> UINavigationController {
        let viewController = MainScreenViewController(nibName: MainScreenViewController.className, bundle: nil)
        viewController.viewModel = MainScreenViewModel()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
