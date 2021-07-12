//
//  RepoDetailsCoordinator.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 11.07.21.
//

import UIKit

final class RepoDetailsCoordinator: BaseCoordinator{
    private let navigationController: UINavigationController
    private let repo: Repository
    
    init(navigationController: UINavigationController, repo: Repository) {
        self.navigationController = navigationController
        self.repo = repo
    }
    
    override func start() {
        addCoordinator(self)
        let viewModel = RepoDetailsViewModel(coordinator: self, repo: repo)
        let viewController = RepoDetailsViewController.newInstance(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        removeCoordinator(self)
    }
    
    deinit {
        debugPrint("deinit from RepoDetailsCoordinator")
    }
}
