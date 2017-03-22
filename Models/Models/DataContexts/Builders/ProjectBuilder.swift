//
//  ProjectBuilder.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Models

class ProjectBuilder {
    
    // MARK:- Properties
    
    private let context: NSManagedObjectContext
    
    private let projectName: String
    private let projectKind: ProjectMO.Kind
    private let projectPath: URL
    
    private var resources: [String: ResourceMO.Kind] = [:]
    private var resourcesPaths: [String: [URL]] = [:]
    
    // MARK:- Lifecycle
    
    init(for projectPath: URL, using context: NSManagedObjectContext) {
        self.context = context
        self.projectPath = projectPath
        
        let projectNameWithExtension = projectPath.lastPathComponent
        let fileExtension = projectPath.pathExtension
        
        projectName = projectNameWithExtension.replacingOccurrences(of: ".\(fileExtension)", with: "")
        projectKind = .application
    }
    
    // MARK:- API
    
    func build() {
        scanWorkspace()
        createWorkspace()
    }
    
    private func scanWorkspace() {
        guard let iterator = FileManager.default.enumerator(at: projectPath.deletingLastPathComponent(), includingPropertiesForKeys: nil) else { return }
        
        let resourcePaths = iterator.map { $0 as! URL}
            .filter { !$0.hasDirectoryPath }
            .filter { ResourceMO.Kind.isResource($0.pathExtension) }
        
        resourcePaths.forEach { add(path: $0) }
    }
    
    private func add(path url: URL) {
        let resourceNameWithExtension = url.lastPathComponent
        let fileExtension = url.pathExtension
        let resourceName = resourceNameWithExtension.replacingOccurrences(of: ".\(fileExtension)", with: "")
        
        if var paths = resourcesPaths[resourceName] {
            resources[resourceName]?.promote(to: ResourceMO.Kind(from: fileExtension))
            paths.append(url)
            resourcesPaths[resourceName] = paths
        } else {
            resources[resourceName] = ResourceMO.Kind(from: fileExtension)
            resourcesPaths[resourceName] = [url]
        }
    }
    
    private func createWorkspace() {
        var resourceItems = Set<ResourceMO>()
        for resource in resources {
            guard let paths = resourcesPaths[resource.key] else { continue }
            let object = ResourceMO(context: context)
            object.name = resource.key
            object.kind = resource.value
            
            var localizations = Set<LocalizationMO>()
            for path in paths {
                let localization = LocalizationMO(context: context)
                localization.path = path
                localization.languageCode = ""
                localizations.insert(localization)
            }
            object.localizations = localizations
            
            resourceItems.insert(object)
        }
        
        let project = ProjectMO(context: context)
        project.name = projectName
        project.path = projectPath
        project.kind = projectKind
        project.resources = resourceItems
    }
    
}
