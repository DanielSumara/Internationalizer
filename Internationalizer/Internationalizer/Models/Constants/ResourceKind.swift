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
    
    // MARK:- API
    
    public static func isResource(_ fileExtension: String) -> Bool {
        return ResourceKind.validExtensions.contains(fileExtension)
    }
    
}
