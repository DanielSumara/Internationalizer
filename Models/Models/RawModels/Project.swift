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
    public let path: URL
    public let kind: ProjectKind
    public let resources: [Resource]
    
    // MARK:- Lifecycle
    
    public init(name: String, path: URL, kind: ProjectKind, resources: [Resource]) {
        self.name = name
        self.path = path
        self.kind = kind
        self.resources = resources
    }
    
}

extension Project: Hashable {
    
    public var hashValue: Int { return path.hashValue }
    
}

extension Project: Equatable {
    
}

public func ==(lhs: Project, rhs: Project) -> Bool {
    return lhs.path == rhs.path
}
