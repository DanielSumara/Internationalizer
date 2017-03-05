//
//  OutlineDataContext.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public protocol OutlineDataContext {
    
    var numberOfChilds: Int { get }
    var isExpandable: Bool { get }
    
    func child(at index: Int) -> Any
    
}

public extension OutlineDataContext {
    
    public var isExpandable: Bool { return numberOfChilds > 0 }
    
}
