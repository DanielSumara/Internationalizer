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
    
    let name: String
    let path: String
    let kind: Kind
    
}

extension Resource {
    
    // MARK:- Content
    
    enum Kind {
        
        case storyboard
        case strings
        case xib
        
    }
    
}
