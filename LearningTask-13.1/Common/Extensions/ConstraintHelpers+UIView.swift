//
//  ConstraintHelpers+UIView.swift
//  LearningTask-13.1
//

import UIKit

extension UIView {
    
    // MARK: - Sizing Helpers
    
    /// Constrains the size of your view code component
    ///
    /// - Parameters:
    ///     - size: The `CGSize` representing the desired size to the view.
    ///     Define the contants of the widthAnchor and heightAnchor constraints
    ///
    func constrainSize(to size: CGSize) {
        let constraints = [
            self.widthAnchor.constraint(equalToConstant: size.width),
            self.heightAnchor.constraint(equalToConstant: size.height)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
