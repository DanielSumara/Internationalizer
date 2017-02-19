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
    
    fileprivate let repository: ProjectsRepository
    
    // MARK:- Lifecycle
    
    init(from repository: ProjectsRepository) {
        self.repository = repository
        
        dataSource = repository.projects.map { ProjectViewModel(from: $0) }
    }
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
    func addProject(from url: URL) {
        repository.addProject(from: url)
    }
    
}
