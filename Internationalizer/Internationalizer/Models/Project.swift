//
//  Project.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Project {
    
    // MARK:- Properties
    
    public let name: String
    public let path: String
    public let kind: Kind
    public let resources: [Resource]
    
}

extension Project {
    
    // MARK:- Content
    
    public enum Kind {
        
        case application
        case framework
        
    }
    
}
