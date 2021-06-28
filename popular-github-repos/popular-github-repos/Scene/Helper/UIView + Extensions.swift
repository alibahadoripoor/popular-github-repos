//
//  UIView + Extensions.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import UIKit

extension UIView {
    func fixInView(_ container: UIView!) {
        container.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}
