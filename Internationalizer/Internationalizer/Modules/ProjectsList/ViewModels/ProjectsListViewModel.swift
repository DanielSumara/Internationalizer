//
//  ProjectsListViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Infrastructure
import Models

class ProjectsListViewModel: NSObject {
    
    // MARK:- Properties
    
    weak var view: ProjectsListView? 
    
    fileprivate let coordinator: Coordinator
    fileprivate let repository: RepositoryContext
    
    fileprivate var dataSource: [ProjectViewModel]
    
    // MARK:- Lifecycle
    
    init(with coordinator: Coordinator, and repository: RepositoryContext) {
        self.coordinator = coordinator
        self.repository = repository
        
        let frc = repository.getProjects()
        dataSource = frc.fetchedObjects?.map { ProjectViewModel(from: $0) } ?? []
        
        super.init()
        
        frc.delegate = self
    }
    
}

extension ProjectsListViewModel: NSFetchedResultsControllerDelegate {
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
}

extension ProjectsListViewModel {
    
    func addProject(from url: URL) {
//        switch repository.addProject(from: url) {
//        case .success(let newItem):
//            let newVM = ProjectViewModel(from: newItem)
//            dataSource.append(newVM)
//            dataSource.sort()
//            if let index = dataSource.index(of: newVM) {
//                view?.insert(project: newVM, at: index)
//            }
//        case .failure(let error): print("Shit happens: \(error)"); break // TODO: - Handler error
//        }
    }

    func showDetails(for item: Any?) {
        guard let item = item as? ResourceViewModel else {
            coordinator.showLackOfSelection()
            return
        }
        
//        coordinator.showDetails(for: item.model)
    }
    
}
