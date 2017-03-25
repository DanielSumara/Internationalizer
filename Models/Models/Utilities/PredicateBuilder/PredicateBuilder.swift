//
//  PredicateBuilder.swift
//  Commons
//
//  Created by Daniel Sumara on 28.12.2016.
//  Copyright © 2016 FarmaProm. All rights reserved.
//

import Foundation

public final class PredicateBuilder {
    
    // MARK:- Lifecycle
    
    public init() {
        
    }
    
    // MARK:- Static API
    
    public static func build(_ item: Item) -> NSPredicate {
        return PredicateBuilder().build(item)
    }
    
    // MARK:- API
    
    public func build(_ item: Item) -> NSPredicate {
        return NSPredicate(format: item.format, argumentArray: item.arguments)
    }

}

extension PredicateBuilder {
    
    // MARK:- Helping content
    
    public class Item {
        
        // MARK:- Properties
        
        let format: String
        let arguments: [Any]
        
        // MARK:- Lifecycle
        
        init(with predicate: String, and value: Any) {
            format = predicate
            arguments = [value]
        }
        
        init(with predicate: String, and values: [Any]) {
            format = predicate
            arguments = values
        }
        
        // MARK:- Compound operators
        
        public static func or(_ items: Item...) -> CompoundAttributeItem {
            guard items.count > 1 else { fatalError() }
            let format = items.map { $0.format }.joined(separator: " OR ")
            let arguments = items.map { $0.arguments }.flatMap { $0 }
            return CompoundAttributeItem(with: "(\(format))", and: arguments)
        }
        
        public static func and(_ items: Item...) -> CompoundAttributeItem {
            guard items.count > 1 else { fatalError() }
            let format = items.map { $0.format }.joined(separator: " AND ")
            let arguments = items.map { $0.arguments }.flatMap { $0 }
            return CompoundAttributeItem(with: "(\(format))", and: arguments)
        }
        
        public static func not(_ item: Item) -> CompoundAttributeItem {
            return CompoundAttributeItem(with: "NOT (\(item.format))", and: item.arguments)
        }
        
        //MARK:- Aggreagte operators
        
        public static func any(_ item: SequenceAttributeItem) -> SingleAttributeItem {
            return SingleAttributeItem(with: "ANY \(item.format)", and: item.arguments)
        }
        
        public static func all(_ item: SequenceAttributeItem) -> SingleAttributeItem {
            return SingleAttributeItem(with: "ALL \(item.format)", and: item.arguments)
        }
        
        public static func none(_ item: SequenceAttributeItem) -> SingleAttributeItem {
            return SingleAttributeItem(with: "NONE \(item.format)", and: item.arguments)
        }
        
    }
    
    public final class SingleAttributeItem: Item {
        
    }
    
    public final class SequenceAttributeItem: Item {
        
    }
    
    public final class CompoundAttributeItem: Item {
        
    }
    
}
