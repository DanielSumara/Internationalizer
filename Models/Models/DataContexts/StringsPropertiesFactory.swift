//
//  StringsPropertiesFactory.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 28.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class StringsPropertiesFactory {
    
    // MARK:- Properties
    
    private var lines: [Property] = []
    
    private var isInMultilineComment: Bool = false
    
    // MARK:- API
    
    func create(from path: URL) -> Properties {
        lines.removeAll(keepingCapacity: true)
        
        let fileReader = FileReader(for: path)
        
        for line in fileReader {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
            
            guard !trimmedLine.isEmpty else { continue }
            
            if !isInMultilineComment {
                isInMultilineComment = trimmedLine.startsComment
            }
            
            guard !isInMultilineComment else {
                isInMultilineComment = !trimmedLine.endsComment
                continue
            }
            
            guard !trimmedLine.isComment else { continue }
            
            if let stringsLine = Property(from: trimmedLine) {
                lines.append(stringsLine)
            }
        }
        
        fileReader.close()
        
        let pathComponents = path.pathComponents
        let project = pathComponents[pathComponents.count - 2].components(separatedBy: ".").first!
        
        return Properties(project, with: lines)
    }
    
}

fileprivate extension String {
    
    var startsComment: Bool { return self.hasPrefix("/*") }
    var endsComment: Bool { return self.hasSuffix("*/") }
    var isComment: Bool { return self.hasPrefix("#") || hasPrefix("//") }
    
}

fileprivate extension Property {
    
    init?(from line: String) {
        let pair = line.components(separatedBy: "=")
        guard pair.count == 2 else { return nil }
        
        var key = pair[0].trimmingCharacters(in: .whitespacesAndNewlines)
        key.remove(at: key.startIndex)
        key.remove(at: key.index(key.endIndex, offsetBy: -1))
        key = key.trimmingCharacters(in: .whitespaces)
        var value = pair[1].trimmingCharacters(in: .whitespacesAndNewlines)
        value.remove(at: value.startIndex)
        value.remove(at: value.index(value.endIndex, offsetBy: -1))
        value = value.trimmingCharacters(in: .whitespaces)
        value.remove(at: value.index(value.endIndex, offsetBy: -1))
        value = value.trimmingCharacters(in: .whitespaces)
        
        self.init(key, equal: value)
    }
    
}
