//
//  RepoCell.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import UIKit

final class RepoCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    func updateCell(with viewModel: RepoCellViewModel){
        repoNameLabel.text = viewModel.name
        desLabel.text = viewModel.des
        starsLabel.text = viewModel.starsCount
        forksLabel.text = viewModel.forksCount
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       if #available(iOS 13.0, *) {
           if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
                containerView.layer.borderColor = UIColor(named: "MyPurple")?.cgColor
           }
       }
    }
}
