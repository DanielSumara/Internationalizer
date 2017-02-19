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
    
}

