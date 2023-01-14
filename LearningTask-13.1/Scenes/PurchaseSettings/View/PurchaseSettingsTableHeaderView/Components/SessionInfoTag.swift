//
//  SessionInfoTag.swift
//  LearningTask-13.1
//
//

import UIKit

class SessionInfoTag: UIView {
    // MARK: Subviews
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Properties

    var info: String? {
        didSet {
            textLabel.text = info
        }
    }
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError()
    }

}

extension SessionInfoTag: ViewCode {
    
    func customizeAppearance() {
        backgroundColor = .systemOrange
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
    
    func addSubviews() {
        addSubview(textLabel)
    }
    
    func addLayoutConstraints() {
        self.constrainHeight(to: 20)
        
        textLabel.constrainHorizontally(to: self, withMargins: 8)
        textLabel.anchorToCenterY(of: self)
    }
    
}
