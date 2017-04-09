//
//  Formatters+Booleans.swift
//  Commons
//
//  Created by Daniel Sumara on 09.04.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public extension Formatters {
    
    public struct Booleans {
        
        public static func getString(from value: Bool) -> String {
            return value ? "Yes" : "No"
        }
        
    }

    
}
