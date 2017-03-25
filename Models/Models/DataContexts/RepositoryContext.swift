//
//  RepositoryContext.swift
//  Models
//
//  Created by Daniel Sumara on 11.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import CoreData
import Infrastructure

public class RepositoryContext {
    
    // MARK:- Properties
    
    private let context: ManagedObjectContext
    
    // MARK:- Lifecycle
    
    init(with context: ManagedObjectContext) {
        self.context = context
    }
    
    // MARK:- API
    
    public func getProjects() -> NSFetchedResultsController<ProjectMO> {
        let request = ProjectMO.getRequest() as NSFetchRequest<ProjectMO>
        request.sortDescriptors = [NSSortDescriptor(key: ProjectMO.Attribute.name.name, ascending: true)]
        return NSFetchedResultsController<ProjectMO>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    public func addProject(from url: URL) {
        if let savedProject = tryGetProject(from: url) {
            print(savedProject.name)
            return
        }
        let watchDog = WatchDog(named: "Create and save project")
        ProjectBuilder(for: url, using: context).build()
        try! context.save()
    }
    
    // MARK:- Methods
    
    private func tryGetProject(from url: URL) -> ProjectMO? {
        let watchDog = WatchDog(named: "Fetching projects for validate")
        let request = FetchRequest(for: ProjectMO.self)
        request.predicate = PredicateBuilder().build(Attribute(ProjectMO.Attribute.path).isEqual(to: url.absoluteString))
        
        return context.fetch(using: request).first
    }
    
}
