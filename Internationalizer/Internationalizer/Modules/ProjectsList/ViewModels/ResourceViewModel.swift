//
//  ResourceViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class ResourceViewModel {
    
    // MARK:- Properties
    
    let name: String
    let kind: ResourceKind
    let path: String
    
    fileprivate let resource: Resource
    
    // MARK:- Lifecycle
    
    init(from resource: Resource) {
        self.resource = resource
        
        name = resource.name
        kind = resource.kind
        path = resource.path
    }
    
}

extension ResourceViewModel: NavigatorItem {
    
    var icon: NSImage {
        return #imageLiteral(resourceName: "IconFramwork")
    }
    
}
