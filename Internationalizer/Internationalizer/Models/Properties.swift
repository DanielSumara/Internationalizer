//
//  Properties.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 04.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

struct Properties {
    
    // MARK:- Properties
    
    let name: String
    let properties: [Property]
    
    fileprivate let propertiesDictionary: [String: Property]
    
    // MARK:- Lifecycle
    
    init(_ name: String, with properties: [Property]) {
        self.name = name
        self.properties = properties
        propertiesDictionary = properties.toDictionary { ($0.key, $0) }
    }
    
}

extension Properties {
    
    // MARK:- API
    
    var keys: [String] { return Array(propertiesDictionary.keys) }
    
    func getValue(for key: String) -> String? {
        guard let property = propertiesDictionary[key] else { return nil }
        return property.value
    }
    
}

extension Properties: Equatable {
    
    static func ==(lhs: Properties, rhs: Properties) -> Bool {
        guard lhs.name == rhs.name else { return false }
        return lhs.properties == rhs.properties
    }
    
}

extension Properties: Comparable {
    
    static func <(lhs: Properties, rhs: Properties) -> Bool {
        return lhs.name < rhs.name
    }
    
}

