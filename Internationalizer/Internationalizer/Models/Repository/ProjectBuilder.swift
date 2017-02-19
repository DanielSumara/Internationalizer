//
//  ProjectBuilder.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class ProjectBuilder {
    
    // MARK:- Properties
    
    private let projectName: String
    private let projectKind: ProjectKind
    private let projectPath: URL
    
    private var resources: [String: ResourceKind] = [:]
    private var resourcesPaths: [String: [URL]] = [:]
    
    // MARK:- Lifecycle
    
    init(for projectPath: URL) {
        self.projectPath = projectPath
        
        let projectNameWithExtension = projectPath.lastPathComponent
        let fileExtension = projectPath.pathExtension
        
        projectName = projectNameWithExtension.replacingOccurrences(of: ".\(fileExtension)", with: "")
        projectKind = .application
    }
    
    // MARK:- API
    
    func add(path url: URL) {
        let resourceNameWithExtension = url.lastPathComponent
        let fileExtension = url.pathExtension
        let resourceName = resourceNameWithExtension.replacingOccurrences(of: ".\(fileExtension)", with: "")
        
        if var paths = resourcesPaths[resourceName] {
            paths.append(url)
        } else {
            resources[resourceName] = ResourceKind(from: fileExtension)
            resourcesPaths[resourceName] = [url]
        }
    }
    
    func build() -> Project {
        var resourceItems: [Resource] = []
        
        for resource in resources {
            guard let paths = resourcesPaths[resource.key] else { continue }
            resourceItems.append(Resource(name: resource.key, paths: paths, kind: resource.value))
        }
        
        return Project(name: projectName, path: projectPath, kind: projectKind, resources: resourceItems)
    }
    
}
