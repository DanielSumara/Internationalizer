//
//  PropertyMO+Attributes.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

extension PropertyMO {
    
    enum Attribute {
        
        // MARK:- Properties
        
        static let key: (name: String, type: String.Type) = ("key", String.self)
        static let value: (name: String, type: String.Type) = ("value", String.self)
        
        // MARK:- Relations
        
        static let owner: (name: String, type: LocalizationMO.Type) = ("owner", LocalizationMO.self)
        
    }
    
}
