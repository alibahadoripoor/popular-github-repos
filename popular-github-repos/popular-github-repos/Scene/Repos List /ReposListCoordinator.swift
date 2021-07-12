//
//  ReposListCoordinator.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 11.07.21.
//

import UIKit

final class ReposListCoordinator: BaseCoordinator{
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        addCoordinator(self)
        let viewModel = ReposListViewModel(coordinator: self)
        let viewController = ReposListViewController.newInstance(with: viewModel)
        navigationController.viewControllers = [viewController]
    }
    
    func startRepoDetailsViewController(repo: Repository){
        RepoDetailsCoordinator(
            navigationController: navigationController,
            repo: repo
        ).start()
    }
    
    deinit {
        debugPrint("deinit from ReposListCoordinator")
    }
}
