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
        let r1 = Resource(name: "Main", path: "", kind: .storyboard)
        let r2 = Resource(name: "Internationalization", path: "", kind: .strings)
        let r3 = Resource(name: "ViewController", path: "", kind: .xib)
        let r4 = Resource(name: "View", path: "", kind: .xib)
        
        let p1 = Project(name: "Project1", path: "", kind: .application, resources: [r1, r2, r3, r4])
        
        let r5 = Resource(name: "Orders", path: "", kind: .storyboard)
        let r6 = Resource(name: "OrderTypeDescriptions", path: "", kind: .strings)
        
        let p2 = Project(name: "Framework1", path: "", kind: .framework, resources: [r5, r6])
        
        dataSource = [ProjectViewModel(from: p1), ProjectViewModel(from: p2)]
    }
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
}
