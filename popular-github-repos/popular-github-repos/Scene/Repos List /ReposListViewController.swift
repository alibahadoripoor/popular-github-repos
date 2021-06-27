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
    @IBOutlet weak var centerIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables and Constants
    
    private var viewModel: ReposListViewModel!
    private var topIndicator = UIRefreshControl()
    private lazy var bottomIndicator: UIView = {
        let footer = UIView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 70))
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.center = footer.center
        footer.addSubview(indicator)
        indicator.startAnimating()
        return footer
    }()
    
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
        setupCallBacks()
        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions
    
    private func setupUI(){
        title = "Popular Repositories"
        topIndicator.addTarget(self, action: #selector(reloadRepos), for: .valueChanged)
        tableView.refreshControl = topIndicator
    }
    
    @objc dynamic private func reloadRepos(){
        viewModel.viewDidRefresh()
    }
    
    private func setupCallBacks(){
        viewModel.onFetchCompleted = { [weak self] (type) in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
            switch type {
            case .firstLoad:
                self.centerIndicator.stopAnimating()
            case .refresh:
                self.topIndicator.endRefreshing()
            case .nextPage:
                self.tableView.tableFooterView = nil
            }
        }
        viewModel.onFetchingInProgress = { [weak self] (type) in
            guard let self = self else {
                return
            }
            switch type {
            case .firstLoad:
                self.centerIndicator.startAnimating()
            case .nextPage:
                self.tableView.tableFooterView = self.bottomIndicator
            default:
                break
            }
        }
        viewModel.onFetchFailed = { [weak self] (title, message) in
            self?.showAlert(title, message: message)
        }
    }
    
    // MARK: - ScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 70 - scrollView.frame.size.height){
            viewModel.viewDidScrollToBottom()
        }
    }
}

// MARK: - TableView Delegate and DataSource

extension ReposListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.dequeueReusableCell(withIdentifier: RepoCell.identifire) == nil{
            tableView.register(UINib(nibName: RepoCell.identifire, bundle: nil),
                               forCellReuseIdentifier: RepoCell.identifire)
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.identifire, for: indexPath) as? RepoCell {
            cell.updateCell(with: viewModel.cellViewModel(for: indexPath))
            return cell
        }
        
        return UITableViewCell()
    }
}
