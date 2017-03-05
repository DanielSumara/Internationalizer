//
//  SequenceExtensions.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 04.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public extension Sequence {
    
    public func toDictionary<Key: Hashable, Value>(_ transformer: (Iterator.Element) -> (Key, Value)) -> Dictionary<Key, Value> {
        var dictionary: [Key: Value] = [:]
        
        for pair in map({ transformer($0) }) {
            dictionary[pair.0] = pair.1
        }
        
        return dictionary
    }
    
    public func toDictionary<Key: Hashable, Value>(_ transformer: (Iterator.Element, Int) -> (Key, Value)) -> Dictionary<Key, Value> {
        var dictionary: [Key: Value] = [:]
        
        for item in self {
            let pair =  transformer(item, dictionary.count)
            dictionary[pair.0] = pair.1
        }
        
        return dictionary
    }
    
}
