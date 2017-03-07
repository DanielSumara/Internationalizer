//
//  ResourceMO.swift
//  Models
//
//  Created by Daniel Sumara on 07.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public class ResourceMO: NSManagedObject {
    
}

public extension ResourceMO {
    
    public enum Kind: String {
        
        case storyboard
        case strings
        case xib
        
    }
    
}

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

extension ResourceMO {
    
    enum Attribute {
        
        // MARK:- Properties
        
        static let name: (name: String, type: String.Type) = ("name", String.self)
        static let kind: (name: String, type: String.Type) = ("kind", String.self)
        
        // MARK:- Relations
        
        static let localizations: (name: String, type: Set<LocalizationMO>.Type) = ("localizations", Set<LocalizationMO>.self)
        static let owner: (name: String, type: ProjectMO.Type) = ("owner", ProjectMO.self)
        
    }
    
}
