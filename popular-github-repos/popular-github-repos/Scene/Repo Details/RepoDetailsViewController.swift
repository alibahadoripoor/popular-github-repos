//
//  RepoDetailsViewController.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 27.06.21.
//

import UIKit
import Kingfisher

final class RepoDetailsViewController: BaseViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables and Constants
    
    private var viewModel: RepoDetailsViewModel!
    private var header = RepoDetailsHeaderView()
    
    // MARK: - Class Functions
    
    class func newInstance(with viewModel: RepoDetailsViewModel) -> RepoDetailsViewController {
        let viewController = RepoDetailsViewController(nibName: String(describing: RepoDetailsViewController.self), bundle: nil)
        viewController.viewModel = viewModel
        return viewController
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCallBacks()
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }

    // MARK: - Private Functions
    
    private func setupUI(){
        title = "Repository Details"
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    private func setupCallBacks(){
        viewModel.onFetchCompleted = { [weak self] in
            self?.reloadHeader()
        }
        
        viewModel.onFetchFailed = { [weak self] (title, message) in
            self?.showAlert(title, message: message)
        }
    }
    
    private func reloadHeader(){
        header.updateHeader(with: viewModel.headerViewModel())
    }
}

// MARK: - TableView Delegate and DataSource

extension RepoDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
}
