//
//  ServiceNetworkReachability.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation
import Alamofire

protocol ServiceNetworkReachabilityDelegate {
    func networkReachability(active: Bool)
}

class ServiceNetworkReachability {
    static let shared = ServiceNetworkReachability()
    private let reachabilityManager = NetworkReachabilityManager(host: app.service.baseUrl)
    var networkStatus: ((Bool) -> Void)?

    private var isReachable: Bool = false {
        didSet {
            guard let networkStatus = networkStatus else { return }
            networkStatus(isReachable)
        }
    }

    func startNetworkMonitoring() {
        reachabilityManager?.startListening(onUpdatePerforming: { status in
            switch status {
            case .notReachable:
                self.isReachable = false
                print("internet baglantisi yok")
            case .reachable(.cellular):
                self.isReachable = true
                print("cellular bagli")
            case .reachable(.ethernetOrWiFi):
                self.isReachable = true
                print("wifi bagli")
            case .unknown:
                print("Unknown network state")
                self.isReachable = false
            }
        })
    }
}
