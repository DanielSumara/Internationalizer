//
//  RootCoordinator.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Models

class RootCoordinator {
    
    // MARK:- Properties
    
    fileprivate weak var list: ProjectsListView!
    fileprivate weak var details: ResourceDetailsView!
    
    fileprivate var repository: RepositoryContext!
    
    // MARK:- Lifecycle
    
    init(with list: ProjectsListView, and details: ResourceDetailsView) {
        self.list = list
        self.details = details
    }
    
    // MARK:- API
    
    func start() {
        RepositoryFactory().createContext { result in
            switch result {
            case .success(let context):
                self.repository = context
                self.configure()
            case .failure(let error):
                print(error)
                abort()
            }
        }
    }
    
    private func configure() {
        list.viewModel = ProjectsListViewModel(with: self, and: repository)
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
