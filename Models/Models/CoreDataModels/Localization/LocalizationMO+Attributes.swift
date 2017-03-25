//
//  LocalizationMO+Attributes.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

extension LocalizationMO {
    
    enum Attribute {
        
        // MARK:- Properties
        
        static let path: (name: String, type: String.Type) = ("path", String.self)
        static let languageCode: (name: String, type: String.Type) = ("languageCode", String.self)
        
        // MARK:- Relations
        
        static let owner: (name: String, type: ResourceMO.Type) = ("owner", ResourceMO.self)
        static let properties: (name: String, type: Set<PropertyMO>.Type) = ("properties", Set<PropertyMO>.self)
        
    }
    
}
