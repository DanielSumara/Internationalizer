//
//  ResourceMO+KindExtensions.swift
//  Models
//
//  Created by Daniel Sumara on 20.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public extension ResourceMO.Kind {
    
    // MARK:- Lifecycle
    
    public init?(from fileExtension: String) {
        guard ResourceMO.Kind.isResource(fileExtension) else { return nil }
        switch fileExtension {
        case ResourceMO.Kind.storyboard.fileExtension: self = .storyboard
        case ResourceMO.Kind.strings.fileExtension: self = .strings
        case ResourceMO.Kind.xib.fileExtension: self = .xib
        default: return nil
        }
    }
    
    // MARK:- Static properties
    
    public static let validExtensions: [String] = [
        ResourceMO.Kind.storyboard.fileExtension,
        ResourceMO.Kind.strings.fileExtension,
        ResourceMO.Kind.xib.fileExtension
    ]
    
    // MARK:- Properties
    
    public var fileExtension: String {
        switch self {
        case .storyboard: return "storyboard"
        case .strings: return "strings"
        case .xib: return "xib"
        }
    }
    
    public var order: Int {
        switch self {
        case .storyboard: return 0
        case .xib: return 1
        case .strings: return 2
        }
    }
    
    // MARK:- Static API
    
    public static func isResource(_ fileExtension: String) -> Bool {
        return ResourceMO.Kind.validExtensions.contains(fileExtension)
    }
    
    // MARK:- API
    
    public mutating func promote(to newResourceKind: ResourceMO.Kind?) {
        guard let newResourceKind = newResourceKind else { return }
        guard newResourceKind != .strings else { return }
        self = newResourceKind
    }
    
}
