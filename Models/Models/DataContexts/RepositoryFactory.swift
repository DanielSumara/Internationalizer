//
//  RepositoryFactory.swift
//  Models
//
//  Created by Daniel Sumara on 20.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Infrastructure

public class RepositoryFactory {
    
    // MARK:- Properties
    
    lazy private var applicationDocumentsDirectory: URL = self.getApplicationDirectory()
    lazy private var managedObjectModel: NSManagedObjectModel = self.createObjectModel()
    lazy private var persistentStoreCoordinator: NSPersistentStoreCoordinator = self.createCoordinator()
    lazy private var managedObjectContext: ManagedObjectContext = self.createContext()
    
    private let watchDog = WatchDog()
    
    // MARK:- Lifecycle

    /// NOTE:- Do not capture factory reference otherwise cycle will appear and memory leak
    public init() {
        
    }
    
    // MARK:- API
    
    public func createContext(with completion: @escaping (OperationResult<RepositoryContext>) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            let context = self.managedObjectContext
            DispatchQueue.main.async {
                completion(.success(with: RepositoryContext(with: context)))
            }
        }
    }
    
    // MARK:- Methods
    
    private func getApplicationDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count - 1]
    }
    
    private func createObjectModel() -> NSManagedObjectModel {
        let modelURL = Bundle(for: RepositoryFactory.self).url(forResource: "Workspaces", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }
    
    private func createCoordinator() -> NSPersistentStoreCoordinator {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("Workspaces.sqlite")
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            abort()
        }
        
        return coordinator
    }
    
    private func createContext() -> ManagedObjectContext {
        var managedObjectContext = ManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        return managedObjectContext
    }
    
}
