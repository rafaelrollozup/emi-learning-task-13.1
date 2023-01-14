//
//  CustomPatterns+DateFormatter.swift
//  LearningTask-13.1
//
//  Created by rafael.rollo on 10/06/2022.
//

import Foundation

extension DateFormatter {
    
    private static var dayPlusMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    private static var weekdayStringFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    private static var hoursPlusMinutesFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "kk:mm"
        return formatter
    }()
    
    private static var weekdayStringPlusDateAndHoursFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd/MM kk:mm"
        return formatter
    }()
    
    enum CustomPattern {
        case dayPlusMonth
        case weekdayString
        case hoursPlusMinutes
        case weekdayStringPlusDateAndHours
        
        var formatter: DateFormatter {
            switch self {
            case .dayPlusMonth:
                return DateFormatter.dayPlusMonthFormatter
            case .weekdayString:
                return DateFormatter.weekdayStringFormatter
            case .hoursPlusMinutes:
                return DateFormatter.hoursPlusMinutesFormatter
            case .weekdayStringPlusDateAndHours:
                return DateFormatter.weekdayStringPlusDateAndHoursFormatter
            }
        }
    }
    
    static func format(date: Date, to customPattern: CustomPattern) -> String {
        return customPattern.formatter.string(from: date)
    }
    
}
