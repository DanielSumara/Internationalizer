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
    
    public var projects: [Project] { return Array(projectsSet) }
    private var projectsSet: Set<Project> 
    
    // MARK:- Lifecycle
    
    public init() {
        projectsSet = Set(ProjectsRepository.getFakeProjects())
    }
    
    // MARK:- API
    
    public func addProject(from projectUrl: URL) -> OperationResult<Project> {
        // TODO:- Create valid error object
        let url = projectUrl.deletingLastPathComponent()
        guard let iterator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil) else { return .failure(with: NSError()) }
        
        let resourcePaths = iterator.map { $0 as! URL}
            .filter { !$0.hasDirectoryPath }
            .filter { ResourceKind.isResource($0.pathExtension) }

        let builder = ProjectBuilder(for: projectUrl)
        resourcePaths.forEach { builder.add(path: $0) }
        
        let project = builder.build()
        
        // TODO: - Create valid error object
        guard !projectsSet.contains(project) else { return .failure(with: NSError(domain: "", code: -1, userInfo: nil)) }
        
        projectsSet.insert(project)
        
        return .success(data: project)
    }
    
}

extension ProjectsRepository {
    
    fileprivate static func getFakeProjects() -> [Project] {
        let r1 = Resource(name: "Main", paths: [], kind: .storyboard)
        let r2 = Resource(name: "Internationalization", paths: [], kind: .strings)
        let r3 = Resource(name: "ViewController", paths: [], kind: .xib)
        let r4 = Resource(name: "View", paths: [], kind: .xib)
        
        let p1 = Project(name: "Applicator", path: URL(fileURLWithPath: "1"), kind: .application, resources: [r1, r2, r3, r4])
        
        let r5 = Resource(name: "Orders", paths: [], kind: .storyboard)
        let r6 = Resource(name: "OrderTypeDescriptions", paths: [], kind: .strings)
        
        let p2 = Project(name: "OrdersModule", path: URL(fileURLWithPath: "2"), kind: .framework, resources: [r5, r6])
        
        let r7 = Resource(name: "Reports", paths: [], kind: .storyboard)
        let r8 = Resource(name: "Reports", paths: [], kind: .strings)
        let r9 = Resource(name: "ReportTypeDescriptions", paths: [], kind: .strings)
        
        let p3 = Project(name: "Reports", path: URL(fileURLWithPath: "3"), kind: .framework, resources: [r7, r8, r9])
        
        let p4 = Project(name: "Project w/o resources", path: URL(fileURLWithPath: "4"), kind: .framework, resources: [])
        
        return [
            p1,
            p2,
            p3,
            p4
        ]
    }
    
}
