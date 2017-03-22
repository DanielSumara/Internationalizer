//
//  WatchDog.swift
//  Infrastructure
//
//  Created by Daniel Sumara on 22.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public final class WatchDog {
    
    // MARK:- Properties
    
    private let created = Date()
    
    private let label: String
    
    // MARK:- Lifecycle
    
    public init(named label: String = #file) {
        self.label = label
    }
    
    deinit {
        let diff = Date().timeIntervalSince(created)
        print("WatchDog[\(getName())] stopped after: \(diff) seconds")
    }
    
    // MARK:- Methods
    
    private func getName() -> String {
        if label.contains("/") && label.contains(".") {
            return fileNameWithoutSuffix(label)
        }
        return label
    }
    
    /// returns the filename of a path
    func fileNameOfFile(_ file: String) -> String {
        let fileParts = file.components(separatedBy: "/")
        if let lastPart = fileParts.last {
            return lastPart
        }
        return ""
    }
    
    /// returns the filename without suffix (= file ending) of a path
    func fileNameWithoutSuffix(_ file: String) -> String {
        let fileName = fileNameOfFile(file)
        
        if !fileName.isEmpty {
            let fileNameParts = fileName.components(separatedBy: ".")
            if let firstPart = fileNameParts.first {
                return firstPart
            }
        }
        return ""
    }
    
}
