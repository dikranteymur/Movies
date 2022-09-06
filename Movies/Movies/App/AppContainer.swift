//
//  AppContainer.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = AppService()
}
