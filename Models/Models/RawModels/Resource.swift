//
//  Resource.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Resource {
    
    // MARK:- Properties
    
    public let name: String
    public let paths: [URL]
    public let kind: ResourceKind
    
    // MARK:- Lifecycle
    
    public init(name: String, paths: [URL], kind: ResourceKind) {
        self.name = name
        self.paths = paths
        self.kind = kind
    }
    
}
