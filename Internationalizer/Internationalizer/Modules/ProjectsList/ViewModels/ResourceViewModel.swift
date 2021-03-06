//
//  ResourceViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Models

class ResourceViewModel {
    
    // MARK:- Properties
    
    let name: String
    let kind: ResourceMO.Kind
    let paths: [URL]
    
    fileprivate let resource: ResourceMO
    
    // MARK:- Lifecycle
    
    init(from resource: ResourceMO) {
        self.resource = resource
        
        name = resource.name
        kind = resource.kind
        paths = [] //resource.paths
    }
    
}

extension ResourceViewModel: NavigatorItem {
    
    var icon: NSImage {
        switch kind {
        case .storyboard: return R.Images.storyboard
        case .strings: return R.Images.strings
        case .xib: return R.Images.xib
        }
    }
    
}

extension ResourceViewModel {
    
    var model: ResourceMO { return resource }
    
}

extension ResourceViewModel: Comparable {
    
}

func ==(lhs: ResourceViewModel, rhs: ResourceViewModel) -> Bool {
    return lhs.name == rhs.name
}

func <(lhs: ResourceViewModel, rhs: ResourceViewModel) -> Bool {
    if lhs.kind.order == rhs.kind.order {
        return lhs.name < rhs.name
    }
    return lhs.kind.order < rhs.kind.order
}
