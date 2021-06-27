//
//  RepoCell.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import UIKit

final class RepoCell: UITableViewCell {
    
    static let identifire = String(describing: RepoCell.self)

    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    //MARK: - Update UI Functions
    
    func updateCell(with viewModel: RepoCellViewModel){
        repoNameLabel.text = viewModel.name
        languageLabel.text = viewModel.language
        starsLabel.text = viewModel.starsCount
        forksLabel.text = viewModel.forksCount
    }
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerViewSetup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
             containerView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
        }
    }
    
    //MARK: - Private UI Functions
    
    private func containerViewSetup(){
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
    }
}
