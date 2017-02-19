//
//  RootCoordinator.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class RootCoordinator {
    
    // MARK:- Properties
    
    fileprivate weak var list: ProjectsListView!
    fileprivate weak var details: ResourceDetailsView!
    
    fileprivate var projectRepository: ProjectsRepository = ProjectsRepository()
    
    // MARK:- Lifecycle
    
    init(with list: ProjectsListView, and details: ResourceDetailsView) {
        self.list = list
        self.details = details
    }
    
    // MARK:- API
    
    func start() {
        list.viewModel = ProjectsListViewModel(from: projectRepository, with: self)
    }
    
}

extension RootCoordinator: Coordinator {
   
    func showDetails(for resource: Resource) {
        details.showDetails(for: resource)
    }
    
    func showLackOfSelection() {
        details.showLackOfSelection()
    }
    
}
