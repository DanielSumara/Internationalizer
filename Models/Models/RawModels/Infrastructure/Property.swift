//
//  Property.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 04.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Property {
    
    // MARK:- Properties
    
    public let key: String
    public let value: String?
    
    // MARK:- Lifecycle
    
    public init(_ key: String, equal value: String) {
        self.key = key
        self.value = value
    }
    
    public init(_ key: String) {
        self.key = key
        value = nil
    }
    
}

extension Property: Equatable {
    
    public static func ==(lhs: Property, rhs: Property) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
    
}
