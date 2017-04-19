//
//  Formatters+Numbers.swift
//  Commons
//
//  Created by Daniel Sumara on 09.04.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public extension Formatters {
    
    public struct Numbers {
        
        // MARK:- Properties
        
        private static let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()
        
        private static let decimalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            
            return formatter
        }()
        
        private static let integerFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            
            return formatter
        }()
        
        // MARK:- API
        
        // MARK: Integers
        
        public static func getIntegerString(from value: Int64?, defaultValue: String = "") -> String {
            if let value = value {
                return integerFormatter.string(from: NSNumber(value: value)) ?? defaultValue
            }
            return defaultValue
        }
        
        public static func getIntegerString(from value: Int?, defaultValue: String = "") -> String {
            if let value = value {
                return integerFormatter.string(from: NSNumber(value: value)) ?? defaultValue
            }
            return defaultValue
        }
        
        public static func getIntegerString(from value: Double?, defaultValue: String = "") -> String {
            if let value = value {
                return integerFormatter.string(from: NSNumber(value: value)) ?? defaultValue
            }
            return defaultValue
        }
        
        // MARK: Decimals
        
        public static func getDecimalString(from value: Double?, defaultValue: String = "") -> String {
            if let value = value {
                return decimalFormatter.string(from: NSNumber(value: value)) ?? defaultValue
            }
            return defaultValue
        }
        
        // MARK: Currency
        
        public static func getCurrencyString(from value: Double?, defaultValue: String = "") -> String {
            if let value = value {
                return currencyFormatter.string(from: NSNumber(value: value)) ?? defaultValue
            }
            return defaultValue
        }
        
    }
    
}
