//
//  Formatters+Dates.swift
//  Commons
//
//  Created by Daniel Sumara on 09.04.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public extension Formatters {
    
    public struct Dates {
        
        // MARK:- Properties
        
        private static let shortDateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.shortDate.rawValue
            
            return dateFormatter
        }()
        
        private static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.date.rawValue
            
            return dateFormatter
        }()
        
        private static let timeFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.time.rawValue
            
            return dateFormatter
        }()
        
        private static let dateAndTimeFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.dateAndTime.rawValue
            
            return dateFormatter
        }()
        
        // MARK:- API
        
        public static func get(_ format: Format, from date: Date?, defaultValue: String = "") -> String {
            guard let date = date else { return defaultValue }
            
            switch format {
            case .date: return dateFormatter.string(from: date)
            case .dateAndTime: return dateAndTimeFormatter.string(from: date)
            case .shortDate: return shortDateFormatter.string(from: date)
            case .time: return timeFormatter.string(from: date)
            }
        }
        
    }
    
}

public extension Formatters.Dates {
    
    // MARK:- Helping content
    
    public enum Format: String {
        
        // MARK:- Presentation
        
        /// Format daty: **d MMMM yyyy**
        ///
        /// Przykład: **13 lutego 2017**
        case shortDate = "d MMMM yyyy"
        
        /// Format daty: **EEEE, d MMMM yyyy**
        ///
        /// Przykład: **poniedziałek, 13 lutego 2017**
        case date = "EEEE, d MMMM yyyy"
        
        /// Format daty: **HH:mm:ss**
        ///
        /// Przykład: **13:12**
        case time = "HH:mm"
        
        /// Format daty: **EEEE, d MMMM yyyy HH:mm:ss**
        ///
        /// Przykład: **poniedziałek, 13 lutego 2017 13:12**
        case dateAndTime = "EEEE, d MMMM yyyy HH:mm"
        
    }
    
}
