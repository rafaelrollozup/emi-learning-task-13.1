//
//  ConstraintHelpers+UIView.swift
//  LearningTask-13.1
//

import UIKit

extension UIView {
    
    // MARK: - SafeArea Anchors
    private var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }

    private var safeLeadingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leadingAnchor
    }

    private var safeTrailingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.trailingAnchor
    }

    private var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    // MARK: - Containing Helpers
    
    /// Constrains the bounds of your view code component to the bounds of its superview
    /// from the given components.
    ///
    /// - Parameters:
    ///     - view: The target view to constrain to
    ///     - verticalMargin: The margin to apply as the constant of the top and bottom anchor constraints
    ///     - horizontalMargin: The margin to apply as the constant of the leading and trailing anchor constraints
    ///
    func constrainTo(edgesOf view: UIView,
                     verticalMargins verticalMargin: CGFloat = .zero,
                     horizontalMargins horizontalMargin: CGFloat = .zero) {
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: verticalMargin),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -verticalMargin),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    /// Constrains the bounds of your view code component to the bounds of the
    /// safeAreaLayoutGuide of its superview
    ///
    /// - Parameters:
    ///     - view: The target view to constrain to `safeAreaLayoutGuide`
    ///     - verticalMargin: The margin to apply as the constant of the top and bottom anchor constraints
    ///     - horizontalMargin: The margin to apply as the constant of the leading and trailing anchors constraints
    ///
    func constrainTo(safeEdgesOf view: UIView,
                     verticalMargins verticalMargin: CGFloat = 0,
                     horizontalMargins horizontalMargin: CGFloat = 0) {
        let constraints = [
            topAnchor.constraint(equalTo: view.safeTopAnchor, constant: verticalMargin),
            leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: horizontalMargin),
            bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -verticalMargin),
            trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -horizontalMargin),
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    /// Constrains the leading and trailing of your view code component to the same edges of the target view
    ///
    /// - Parameters:
    ///     - view: The target view to constrain to
    ///     - horizontalMargin: The margin to apply as the constant of the leading and trailing anchor contraints
    ///
    func constrainHorizontally(to view: UIView,
                               withMargins horizontalMargin: CGFloat = 0) {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Positioning Helpers
    
    /// Positions your view code component centering on the Y axis of the target view
    ///
    /// - Parameters:
    ///     - view: The target view to anchor center vertically
    ///     - offset: A float representing the offset to apply as the constant of the
    ///     centerY anchor constraint
    ///
    @discardableResult
    func anchorToCenterY(of view: UIView, withOffset offset: CGFloat = .zero) -> NSLayoutConstraint {
        let constraint = self.centerYAnchor
            .constraint(equalTo: view.centerYAnchor, constant: offset)

        NSLayoutConstraint.activate([constraint])
        return constraint
    }
    
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
    
    /// Constrains the height of your view code component
    ///
    /// - Parameters:
    ///     - constant: The `CGFloat` representing the desired height to the view.
    ///     Define the constant of the heightAnchor constraint
    ///
    /// - Returns: The activated layout constraint's reference
    ///
    @discardableResult
    func constrainHeight(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constrains the height of your view code component by calculating proportionally from the width value
    ///
    /// - Parameters:
    ///     - ratio: The `CGFloat` representing the ratio to apply as a multiplier of the height anchor's value
    ///
    /// - Returns: The activated layout constraint's reference
    ///
    @discardableResult
    func constrainHeightProportionally(byApplying ratio: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: ratio)
        constraint.isActive = true
        return constraint
    }
    
}
