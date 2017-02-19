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
    
    weak var view: ProjectsListView? 
    
    fileprivate var dataSource: [ProjectViewModel]
    
    fileprivate let repository: ProjectsRepository
    
    // MARK:- Lifecycle
    
    init(from repository: ProjectsRepository) {
        self.repository = repository
        
        dataSource = repository.projects.map { ProjectViewModel(from: $0) }.sorted()
    }
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
    func addProject(from url: URL) {
        switch repository.addProject(from: url) {
        case .success(let newItem):
            let newVM = ProjectViewModel(from: newItem)
            dataSource.append(newVM)
            dataSource.sort()
            if let index = dataSource.index(of: newVM) {
                view?.insert(project: newVM, at: index)
            }
        case .failure(let error): print("Shit happens: \(error)"); break // TODO: - Handler error
        }
    }
    
}
