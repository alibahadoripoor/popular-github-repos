//
//  ReposListViewController.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import UIKit

final class ReposListViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables and Constants
    
    private var viewModel: ReposListViewModel!
    
    // MARK: - Class Functions
    
    class func newInstance() -> ReposListViewController {
        let viewController = ReposListViewController(nibName: String(describing: ReposListViewController.self), bundle: nil)
        viewController.viewModel = ReposListViewModel()
        return viewController
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel.viewDidLoad()
        setupCallBacks()
    }

    // MARK: - Private Functions
    
    private func setupUI(){
        title = "Popular Repositories"
        tableView.tableFooterView = UIView()
    }
    
    private func setupCallBacks(){
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.onShowAlert = { [weak self] (title, message) in
            self?.showAlert(title, message: message)
        }
    }
}

// MARK: - TableView Delegates and DataSource

extension ReposListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.cellViewModel(for: indexPath)
        
        if tableView.dequeueReusableCell(withIdentifier: viewModel.identifire) == nil{
            tableView.register(UINib(nibName: viewModel.identifire, bundle: nil),
                               forCellReuseIdentifier: viewModel.identifire)
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifire, for: indexPath) as? RepoCell {
            cell.updateCell(with: viewModel)
            return cell
        }
        
        return UITableViewCell()
    }
}
