//
//  RepositoryContext.swift
//  Models
//
//  Created by Daniel Sumara on 11.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import CoreData

public class RepositoryContext {
    
    // MARK:- Properties
    
    private let context: NSManagedObjectContext
    
    // MARK:- Lifecycle
    
    init(with context: NSManagedObjectContext) {
        self.context = context
    }
    
    // MARK:- API
    
    public func getProjects() -> NSFetchedResultsController<ProjectMO> {
        let request = ProjectMO.getRequest() as NSFetchRequest<ProjectMO>
        request.sortDescriptors = [NSSortDescriptor(key: ProjectMO.Attribute.name.name, ascending: true)]
        return NSFetchedResultsController<ProjectMO>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
}
