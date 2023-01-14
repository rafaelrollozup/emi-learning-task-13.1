//
//  TimeInterval+DateComponentsFormatter.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import Foundation

extension DateComponentsFormatter {
    
    private static var hoursMinutesFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    static func format(timeInterval: TimeInterval) -> String {
        return hoursMinutesFormatter.string(from: timeInterval)!
    }
    
}
