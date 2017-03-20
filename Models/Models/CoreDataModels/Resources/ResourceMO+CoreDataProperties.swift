//
//  ResourceMO+CoreDataProperties.swift
//  Models
//
//  Created by Daniel Sumara on 20.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public extension ResourceMO {
    
    // MARK:- Properties
    
    @NSManaged public var name: String
    
    // MARK:- Backing properties
    
    @NSManaged private var primitiveKind: String
    
    // MARK:- Relations
    
    @NSManaged public var localizations: Set<LocalizationMO>
    @NSManaged public var owner: ProjectMO
    
    // MARK:- Calculated properties
    
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
