//
//  RootCoordinator.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 11.07.21.
//

import UIKit

final class RootCoordinator: BaseCoordinator {
    private let window: UIWindow?
    private var navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    override func start(){
        guard let window = window else {
            return
        }
        ReposListCoordinator(navigationController: navigationController).start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
