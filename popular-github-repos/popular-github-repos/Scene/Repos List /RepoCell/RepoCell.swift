//
//  RepoCell.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import UIKit
import Kingfisher

final class RepoCell: UITableViewCell {
    
    //MARK: - Cell Identifire
    
    static let identifire = String(describing: RepoCell.self)

    //MARK: - Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileLabel: UILabel!
    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    
    //MARK: - Update UI Functions
    
    func updateCell(with viewModel: RepoCellViewModel){
        profileLabel.text = viewModel.ownerName
        repoNameLabel.text = viewModel.name
        languageLabel.text = viewModel.language
        starsLabel.text = viewModel.starsCount
        
        let placeholder = UIImage(named: "user")
        if let url = viewModel.ownerAvatarURL{
            let resource = ImageResource(downloadURL: url, cacheKey: viewModel.ownerAvatarURL?.absoluteString)
            profileImageView.kf.setImage(with: resource, placeholder: placeholder, options: [.transition(.fade(0.2))], progressBlock: nil) { _ in }
        }
    }
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerViewSetup()
        profileImageViewSetup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            containerView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
            profileImageView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
        }
    }
    
    //MARK: - Private Functions
    
    private func containerViewSetup(){
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
    }
    
    private func profileImageViewSetup(){
        profileImageView.layer.cornerRadius = 17
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
    }
}
