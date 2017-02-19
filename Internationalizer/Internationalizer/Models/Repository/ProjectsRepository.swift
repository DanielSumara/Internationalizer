//
//  ProjectsRepository.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public class ProjectsRepository {
    
    // MARK:- Properties
    
    public var projects: [Project] { get { return getProjects() } }
    
    // MARK:- Lifecycle
    
    public init() {
        
    }
    
    // MARK:- API
    
    public func addProject(from url: URL) -> OperationResult {
        // TODO:- Create valid error object
        guard let iterator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil) else { return .failure(with: NSError()) }
        
        let result = iterator.map { $0 as! URL}
            .filter { !$0.hasDirectoryPath }
            .filter { ResourceKind.isResource($0.pathExtension) }
        
        print(result)
        
        return .success
    }
    
}

extension ProjectsRepository {
    
    fileprivate func getProjects() -> [Project] {
        let r1 = Resource(name: "Main", path: "", kind: .storyboard)
        let r2 = Resource(name: "Internationalization", path: "", kind: .strings)
        let r3 = Resource(name: "ViewController", path: "", kind: .xib)
        let r4 = Resource(name: "View", path: "", kind: .xib)
        
        let p1 = Project(name: "Applicator", path: "", kind: .application, resources: [r1, r2, r3, r4])
        
        let r5 = Resource(name: "Orders", path: "", kind: .storyboard)
        let r6 = Resource(name: "OrderTypeDescriptions", path: "", kind: .strings)
        
        let p2 = Project(name: "OrdersModule", path: "", kind: .framework, resources: [r5, r6])
        
        let r7 = Resource(name: "Reports", path: "", kind: .storyboard)
        let r8 = Resource(name: "Reports", path: "", kind: .strings)
        let r9 = Resource(name: "ReportTypeDescriptions", path: "", kind: .strings)
        
        let p3 = Project(name: "Reports", path: "", kind: .framework, resources: [r7, r8, r9])
        
        let p4 = Project(name: "Project w/o resources", path: "", kind: .framework, resources: [])
        
        return [
            p1,
            p2,
            p3,
            p4
        ]
    }
    
}
