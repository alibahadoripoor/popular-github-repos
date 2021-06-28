//
//  BaseView.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import UIKit

class BaseXibView: UIView {

    // MARK: - Outlets
    
    @IBOutlet internal weak var contentView: UIView!

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Lifecycle
    
    override func prepareForInterfaceBuilder() {
        contentView.fixInView(self)
        setupUI()
    }
    
    func setupUI() {

    }

    // MARK: - Private Functions
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName(), owner: self, options: nil)
        self.backgroundColor = .clear
        contentView.fixInView(self)
        setupUI()
    }
    
    private func nibName() -> String {
        return String(describing: type(of: self))
    }
}
