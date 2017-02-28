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
    
    private let resource: Resource
    private let files: [String: StringsFile]
    
    // MARK:- Lifecycle
    
    init(from resource: Resource) {
        self.resource = resource
        
        var files: [String: StringsFile] = [:]
        let builder = StringsFileFactory()
        for path in resource.paths {
            let file = builder.create(from: path)
            files[file.project] = file
        }
        
        self.files = files
    }
    
    deinit {
        print("\(String(describing: self)) deinited")
    }
    
}

extension StringsGridViewModel {
    
    var numberOfItems: Int { return 3 }
    
}
