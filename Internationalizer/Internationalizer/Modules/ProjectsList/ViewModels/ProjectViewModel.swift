//
//  ProjectViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Infrastructure
import Models

class ProjectViewModel {
    
    // MARK:- Properties
    
    let name: String
    let path: URL
    let kind: ProjectMO.Kind
    let resources: [ResourceViewModel]
    
    fileprivate let project: ProjectMO
    
    // MARK:- Lifecycle
    
    init(from project: ProjectMO) {
        self.project = project
        
        name = project.name
        path = project.path
        kind = project.kind
        resources = project.resources.map { ResourceViewModel(from: $0) }.sorted()
    }
    
}

extension ProjectViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return resources.count }
    
    func child(at index: Int) -> Any { return resources[index] }
    
}

extension ProjectViewModel: NavigatorItem {
    
    var icon: NSImage {
        switch kind {
        case .application: return R.Images.application
        case .framework: return R.Images.framework
        }
    }
    
}

extension ProjectViewModel: Comparable {
    
}

func ==(lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
    return lhs.name == rhs.name
}

func <(lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
    return lhs.name < rhs.name
}
