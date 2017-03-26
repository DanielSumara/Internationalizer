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
    fileprivate let fetchedResultController: NSFetchedResultsController<ProjectMO>
    
    fileprivate var dataSource: [ProjectViewModel]
    
    // MARK:- Lifecycle
    
    init(with coordinator: Coordinator, and repository: RepositoryContext) {
        self.coordinator = coordinator
        self.repository = repository
        
        fetchedResultController = repository.getProjects()
        do {
            try fetchedResultController.performFetch()
            dataSource = fetchedResultController.fetchedObjects?.map { ProjectViewModel(from: $0) } ?? []
        } catch {
            print(error)
            dataSource = []
        }
        
        super.init()
        
        fetchedResultController.delegate = self
    }
    
}

extension ProjectsListViewModel: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("frc will change")
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if type == .insert {
            let index = newIndexPath?.item ?? 0
            let newProject = anObject as! ProjectMO
            let viewModel = ProjectViewModel(from: newProject)
            dataSource.insert(viewModel, at: index)
            view?.insert(project: viewModel, at: index)
        }
        print("frc did \(type) object")
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("frc did change")
    }
    
}

extension ProjectsListViewModel: OutlineDataContext {
    
    var numberOfChilds: Int { return dataSource.count }
    
    func child(at index: Int) -> Any { return dataSource[index] }
    
}

extension ProjectsListViewModel {
    
    func addProject(from url: URL) {
        repository.addProject(from: url)
    }

    func showDetails(for item: Any?) {
        guard let item = item as? ResourceViewModel else {
            coordinator.showLackOfSelection()
            return
        }
        
//        coordinator.showDetails(for: item.model)
    }
    
}
