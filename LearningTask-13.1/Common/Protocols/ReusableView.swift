//
//  ReusableView.swift
//  LearningTask-13.1
//
//

import Foundation

protocol ReusableView {
    static var reuseId: String { get }
}

extension ReusableView {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
}
