//
//  ProjectMO+Attributes.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

extension ProjectMO {
    
    enum Attribute {
        
        // MARK:- Properties
        
        static let name: (name: String, type: String.Type) = ("name", String.self)
        static let path: (name: String, type: String.Type) = ("path", String.self)
        static let kind: (name: String, type: String.Type) = ("kind", String.self)
        
        // MARK:- Relations
        
        static let resources: (name: String, type: Set<ResourceMO>.Type) = ("resources", Set<ResourceMO>.self)
        
    }
    
}
