//
//  Theme.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 19/07/2022.
//

import UIKit

protocol ThemeConfigurable: UIViewController {
    func applyTheme()
}

extension ThemeConfigurable {
    func applyTheme() {
        let logoTitleView = LogoTitleView()
        logoTitleView.isLayoutMarginsRelativeArrangement = true
        logoTitleView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        
        navigationItem.titleView = logoTitleView
    }
}

extension UIViewController: ThemeConfigurable {}
