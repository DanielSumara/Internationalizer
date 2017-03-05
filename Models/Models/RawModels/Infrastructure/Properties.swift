//
//  Properties.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 04.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Commons

public struct Properties {
    
    // MARK:- Properties
    
    public let name: String
    public let properties: [Property]
    
    fileprivate let propertiesDictionary: [String: Property]
    
    // MARK:- Lifecycle
    
    public init(_ name: String, with properties: [Property]) {
        self.name = name
        self.properties = properties
        propertiesDictionary = properties.toDictionary { ($0.key, $0) }
    }
    
}

public extension Properties {
    
    // MARK:- API
    
    public var keys: [String] { return Array(propertiesDictionary.keys) }
    
    public func getValue(for key: String) -> String? {
        guard let property = propertiesDictionary[key] else { return nil }
        return property.value
    }
    
}

extension Properties: Equatable {
    
    public static func ==(lhs: Properties, rhs: Properties) -> Bool {
        guard lhs.name == rhs.name else { return false }
        return lhs.properties == rhs.properties
    }
    
}

extension Properties: Comparable {
    
    public static func <(lhs: Properties, rhs: Properties) -> Bool {
        return lhs.name < rhs.name
    }
    
}

