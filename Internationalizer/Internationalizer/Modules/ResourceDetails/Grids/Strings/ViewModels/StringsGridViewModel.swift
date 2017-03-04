//
//  StringsGridViewModel.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 28.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class StringsGridViewModel {
    
    // MARK:- Properties
    
    weak var view: StringsGridView!
    
    fileprivate var files: [String: Properties]
    fileprivate var mapping: [Int: String]
    fileprivate var keys: [String]
    
    private let resource: Resource
    
    // MARK:- Lifecycle
    
    init(from resource: Resource) {
        self.resource = resource
        
        let builder = StringsPropertiesFactory()
        files = resource.paths.map { builder.create(from: $0) }.toDictionary { ($0.name, $0) }
        mapping = files.values.sorted().toDictionary { ($1, $0.name) }
        keys = Array(Set(files.values.flatMap { $0.keys }))
    }
    
    deinit {
        print("\(String(describing: self)) deinited")
    }
    
}

extension StringsGridViewModel {
    
    var numberOfItems: Int { return keys.count }
    var numberOfColumns: Int { return files.count + 1 }
    
    func titleForColumn(at index: Int) -> String {
        guard index != 0 else { return "Key" }
        guard let projectName = mapping[index - 1] else { return "?" }
        return projectName
    }
    
    func value(for identifier: String, at index: Int) -> String? {
        if identifier == "Key" {
            return keys[index]
        }
        
        guard let properties = files[identifier] else { return "?" }
        return properties.getValue(for: keys[index])
    }
    
}
