//
//  PropertyMO.swift
//  Models
//
//  Created by Daniel Sumara on 07.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import CoreData

public class PropertyMO: NSManagedObject {
    
}

public extension PropertyMO {
    
    // MARK:- Properties
    
    @NSManaged public var key: String
    @NSManaged public var value: String?
    
    // MARK:- Relations
    
    @NSManaged public var owner: LocalizationMO
    
}

extension PropertyMO {
    
    enum Attribute {
        
        // MARK:- Properties
        
        static let key: (name: String, type: String.Type) = ("key", String.self)
        static let value: (name: String, type: String.Type) = ("value", String.self)
        
        // MARK:- Relations
        
        static let owner: (name: String, type: LocalizationMO.Type) = ("owner", LocalizationMO.self)
        
    }
    
}
