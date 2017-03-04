//
//  StringsFile.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 28.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

struct StringsFile {
    
    // MARK:- Properties
    
    let project: String
    let properties: Properties
    
}

extension StringsFile: Equatable {
    
    static func ==(lhs: StringsFile, rhs: StringsFile) -> Bool {
        return lhs.project == rhs.project
    }
    
}

extension StringsFile: Comparable {

    static func <(lhs: StringsFile, rhs: StringsFile) -> Bool {
        guard lhs.project != "Base" else { return true }
        guard rhs.project != "Base" else { return false }
        return lhs.project < rhs.project
    }
    
}
