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
    
    private let dataSource: [Project]
    
    // MARK:- Lifecicle
    
    init() {
        let r1 = Resource(name: "R1", path: "", kind: .storyboard)
        let r2 = Resource(name: "R2", path: "", kind: .strings)
        let r3 = Resource(name: "R3", path: "", kind: .xib)
        let r4 = Resource(name: "R4", path: "", kind: .xib)
        
        let p1 = Project(name: "P1", path: "", kind: .framework, resources: [r1, r2, r3, r4])
        
        let r5 = Resource(name: "R5", path: "", kind: .storyboard)
        let r6 = Resource(name: "R6", path: "", kind: .strings)
        
        let p2 = Project(name: "P2", path: "", kind: .framework, resources: [r5, r6])
        
        dataSource = [p1, p2]
    }
    
    // MARK:- Calculated properties
    
    var numberOfProjects: Int { return dataSource.count }
    
    // MARK:- API
    
    func numberOfResources(in project: Project) -> Int {
        return project.resources.count
    }
    
    func project(for index: Int) -> Project {
        return dataSource[index]
    }
    
    func resource(for index: Int, from project: Project) -> Resource {
        return project.resources[index]
    }
    
}
