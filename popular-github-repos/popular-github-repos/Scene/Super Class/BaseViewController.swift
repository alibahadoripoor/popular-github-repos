//
//  BaseViewController.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import UIKit

class BaseViewController: UIViewController{
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
    }
    
    // MARK: - UI
    
    func configureNavigationController(){
        navigationItem.backBarButtonItem = UIBarButtonItem()
        navigationController?.navigationBar.tintColor = UIColor(named: "MyPurple")
    }
    
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
