//
//  LocalizationMO+CoreDataProperties.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public extension LocalizationMO {
    
    // MARK:- Properties
    
    @NSManaged public var languageCode: String
    
    // MARK:- Backing properties
    
    @NSManaged private var primitivePath: String
    
    // MARK:- Relations
    
    @NSManaged public var owner: ResourceMO
    @NSManaged public var properties: Set<PropertyMO>
    
    // MARK:- Caltulated properties
    
    public var path: URL {
        get {
            willAccessValue(forKey: Attribute.path.name)
            defer { didAccessValue(forKey: Attribute.path.name) }
            return URL(string: primitivePath)!
        }
        set {
            willChangeValue(forKey: Attribute.path.name)
            defer { didChangeValue(forKey: Attribute.path.name) }
            primitivePath = newValue.absoluteString
        }
    }
    
}
