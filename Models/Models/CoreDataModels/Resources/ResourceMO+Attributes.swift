//
//  ResourceMO+Attributes.swift
//  Models
//
//  Created by Daniel Sumara on 20.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

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
