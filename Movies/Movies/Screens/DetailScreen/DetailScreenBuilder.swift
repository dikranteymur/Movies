//
//  DetailScreenBuilder.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

final class DetailScreenBuilder {
    static func make() -> DetailScreenViewController {
        let viewController = DetailScreenViewController(nibName: DetailScreenViewController.className, bundle: nil)
        return viewController
    }
}
