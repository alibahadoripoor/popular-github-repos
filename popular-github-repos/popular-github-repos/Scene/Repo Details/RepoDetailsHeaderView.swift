//
//  RepoDetailsHeaderView.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import UIKit
import Kingfisher

final class RepoDetailsHeaderView: BaseXibView {
    
    // MARK: - Outlets
    
    @IBOutlet internal weak var profileImageView: UIImageView!
    @IBOutlet internal weak var profileLabel: UILabel!
    @IBOutlet internal weak var repoNameLabel: UILabel!
    @IBOutlet internal weak var languageLabel: UILabel!
    @IBOutlet internal weak var starsLabel: UILabel!
    @IBOutlet internal weak var forksLabel: UILabel!
    @IBOutlet internal weak var watchersLabel: UILabel!
    @IBOutlet internal weak var descriptionLabel: UILabel!
    @IBOutlet internal weak var footerView: UIView!
    
    //MARK: - Update UI Functions
    
    func updateHeader(with viewModel: RepoDetailsHeaderViewModel){
        profileLabel.text = viewModel.ownerName
        repoNameLabel.text = viewModel.name
        languageLabel.text = viewModel.language
        starsLabel.text = viewModel.starsCount
        forksLabel.text = viewModel.forksCount
        watchersLabel.text = viewModel.watchersCount
        descriptionLabel.text = viewModel.description
        
        let placeholder = UIImage(named: "user")
        if let url = viewModel.ownerAvatarURL{
            let resource = ImageResource(downloadURL: url, cacheKey: viewModel.ownerAvatarURL?.absoluteString)
            profileImageView.kf.setImage(with: resource, placeholder: placeholder, options: [.transition(.fade(0.2))], progressBlock: nil) { _ in }
        }
    }
    
    //MARK: - Lifecycle
    
    override func setupUI() {
        super.setupUI()
        profileImageViewSetup()
        footerViewSetup()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            profileImageView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
        }
    }
    
    //MARK: - Private Functions
    
    private func profileImageViewSetup(){
        profileImageView.layer.cornerRadius = 25
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
    }
    
    private func footerViewSetup(){
        footerView.layer.cornerRadius = 8
    }
}
