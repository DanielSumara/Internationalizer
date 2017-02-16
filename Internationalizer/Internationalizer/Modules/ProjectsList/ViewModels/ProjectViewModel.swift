//
//  ProjectViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class ProjectViewModel {
    
    // MARK:- Properties
    
    let name: String
    let path: String
    let kind: ProjectKind
    let resources: [ResourceViewModel]
    
    fileprivate let project: Project
    
    // MARK:- Lifecycle
    
    init(from project: Project) {
        self.project = project
        
        name = project.name
        path = project.path
        kind = project.kind
        resources = project.resources.map { ResourceViewModel(from: $0) }
    }
    
}

extension ProjectViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return resources.count }
    
    func child(at index: Int) -> Any { return resources[index] }
    
}
