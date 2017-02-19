//
//  ResourceKind.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 16.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public enum ResourceKind {
    
    // MARK:- Enum
    
    case storyboard
    case strings
    case xib
    
    // MARK:- Lifecycle
    
    public init?(from fileExtension: String) {
        guard ResourceKind.isResource(fileExtension) else { return nil }
        switch fileExtension {
        case ResourceKind.storyboard.fileExtension: self = .storyboard
        case ResourceKind.strings.fileExtension: self = .strings
        case ResourceKind.xib.fileExtension: self = .xib
        default: return nil
        }
    }
    
    // MARK:- Static properties
    
    public static let validExtensions: [String] = [
        ResourceKind.storyboard.fileExtension,
        ResourceKind.strings.fileExtension,
        ResourceKind.xib.fileExtension
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
    
    // MARK:- API
    
    public static func isResource(_ fileExtension: String) -> Bool {
        return ResourceKind.validExtensions.contains(fileExtension)
    }
    
}
