//
//  ProjectMO+CoreDataProperties.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public extension ProjectMO {
    
    // MARK:- Properties
    
    @NSManaged public var name: String
    
    // MARK:- Backing properties
    
    @NSManaged private var primitivePath: String
    @NSManaged private var primitiveKind: String
    
    // MARK:- Relations
    
    @NSManaged public var resources: Set<ResourceMO>
    
    // MARK:- Calculated properties
    
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
    
    public var kind: Kind {
        get {
            willAccessValue(forKey: Attribute.kind.name)
            defer { didAccessValue(forKey: Attribute.kind.name) }
            return Kind(rawValue: primitiveKind)!
        }
        set {
            willChangeValue(forKey: Attribute.kind.name)
            defer { didChangeValue(forKey: Attribute.kind.name) }
            primitiveKind = newValue.rawValue
        }
    }
    
}
