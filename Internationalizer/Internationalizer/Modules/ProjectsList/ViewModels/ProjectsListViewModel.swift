//
//  ProjectsListViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class ProjectsListViewModel {
    
    // MARK:- Properties
    
    fileprivate let dataSource: [ProjectViewModel]
    
    // MARK:- Lifecycle
    
    init() {
        let r1 = Resource(name: "R1", path: "", kind: .storyboard)
        let r2 = Resource(name: "R2", path: "", kind: .strings)
        let r3 = Resource(name: "R3", path: "", kind: .xib)
        let r4 = Resource(name: "R4", path: "", kind: .xib)
        
        let p1 = Project(name: "P1", path: "", kind: .framework, resources: [r1, r2, r3, r4])
        
        let r5 = Resource(name: "R5", path: "", kind: .storyboard)
        let r6 = Resource(name: "R6", path: "", kind: .strings)
        
        let p2 = Project(name: "P2", path: "", kind: .framework, resources: [r5, r6])
        
        dataSource = [ProjectViewModel(from: p1), ProjectViewModel(from: p2)]
    }
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
}
