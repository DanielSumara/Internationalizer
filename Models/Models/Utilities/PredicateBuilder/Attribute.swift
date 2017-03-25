//
//  Attribute.swift
//  Networking
//
//  Created by Daniel Sumara on 28.12.2016.
//  Copyright © 2016 FarmaProm. All rights reserved.
//

import Foundation

final class Attribute<AttributeType> {
    
    // MARK:- Properties
    
    public static var SELF: Attribute<AttributeType> { return Attribute(name: "SELF") }
    
    fileprivate let name: String
    
    // MARK:- Lifecycle
    
    init(_ name: String, ofType: AttributeType.Type) {
        self.name = name
    }
    
    init(_ param: (name: String, type: AttributeType.Type)) {
        name = param.name
    }

    private init(name: String) {
        self.name = name
    }
    
    // MARK:- API
    
    func isNil() -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " == NIL", and: [])
    }
    
    func isNotNil() -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " != NIL", and: [])
    }
    
    public func isEqual(to value: AttributeType) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " == %@", and: value)
    }
    
    func isNotEqual(to value: AttributeType) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " != %@", and: value)
    }
    
}

extension Attribute where AttributeType: Equatable {
    
    func isIn(collection: [AttributeType]) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " IN %@", and: collection)
    }
    
}

extension Attribute where AttributeType: Comparable {
    
    func isGreater(then value: AttributeType, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + " >= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + " > %@", and: value)
        }
    }
    
    func isLess(then value: AttributeType, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + " <= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + " < %@", and: value)
        }
    }
    
    func isBetween(_ leftValue: AttributeType, and rightValue: AttributeType) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " BETWEEN %@", and: [leftValue, rightValue])
    }
    
}

extension Attribute where AttributeType: StringType {
    
    func beginsWith(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " BEGINSWITH\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func contains(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " CONTAINS\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func endsWith(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " ENDSWITH\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func like(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " LIKE\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func matches(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + " MATCHES\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
}

extension Attribute where AttributeType: Sequence {
    
    func areEqual(to value: AttributeType.Iterator.Element) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " == %@", and: value)
    }
    
    func count(isEqualTo value: Int) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + ".@count.intValue == %@", and: value)
    }
    
    func count(isGreaterThen value: Int, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + ".@count.intValue >= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + ".@count.intValue > %@", and: value)
        }
    }
    
    func count(isLesserThen value: Int, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + ".@count.intValue <= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + ".@count.intValue < %@", and: value)
        }
    }
    
}

extension Attribute where AttributeType: Sequence, AttributeType.Iterator.Element: NumericType {
    
    func areGreater(then value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SequenceAttributeItem(with: name + " >= %@", and: value)
        case false: return PredicateBuilder.SequenceAttributeItem(with: name + " > %@", and: value)
        }
    }
    
    func areLesser(then value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SequenceAttributeItem(with: name + " <= %@", and: value)
        case false: return PredicateBuilder.SequenceAttributeItem(with: name + " < %@", and: value)
        }
    }

}

extension Attribute where AttributeType: Sequence, AttributeType.Iterator.Element == Date {
    
    func areGreater(then value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SequenceAttributeItem(with: name + " >= %@", and: value)
        case false: return PredicateBuilder.SequenceAttributeItem(with: name + " > %@", and: value)
        }
    }
    
    func areLesser(then value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SequenceAttributeItem(with: name + " <= %@", and: value)
        case false: return PredicateBuilder.SequenceAttributeItem(with: name + " < %@", and: value)
        }
    }
    
}

extension Attribute where AttributeType: Sequence, AttributeType.Iterator.Element: StringType {

    func beginsWith(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " BEGINSWITH\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func contains(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " CONTAINS\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func endsWith(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " ENDSWITH\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func like(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " LIKE\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
    func matches(_ string: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> PredicateBuilder.SequenceAttributeItem {
        return PredicateBuilder.SequenceAttributeItem(with: name + " MATCHES\(switches(for: caseInsensitive, and: diacriticInsensitive)) %@", and: string)
    }
    
}

extension Attribute where AttributeType: Sequence, AttributeType.Iterator.Element: NumericType {
    
    func average(isEqualTo value: AttributeType.Iterator.Element) -> PredicateBuilder.SingleAttributeItem {
        return PredicateBuilder.SingleAttributeItem(with: name + ".@avg.doubleValue == %@", and: value)
    }
    
    func average(isGreaterThen value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + ".@avg.doubleValue >= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + ".@avg.doubleValue > %@", and: value)
        }
    }
    
    func average(isLesserThen value: AttributeType.Iterator.Element, orEqual: Bool = false) -> PredicateBuilder.SingleAttributeItem {
        switch orEqual {
        case true: return PredicateBuilder.SingleAttributeItem(with: name + ".@avg.doubleValue <= %@", and: value)
        case false: return PredicateBuilder.SingleAttributeItem(with: name + ".@avg.doubleValue < %@", and: value)
        }
    }
    
}

extension Attribute {
    
    fileprivate func switches(for caseInsensitive: Bool, and diacriticInsensitive: Bool) -> String {
        switch (caseInsensitive, diacriticInsensitive) {
        case (true, true): return "[cd]"
        case (true, false): return "[c]"
        case (false, false): return ""
        case (false, true): return "[d]"
        }
    }
    
}
