//
//  PropertyMO+CoreDataProperties.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public extension PropertyMO {
    
    // MARK:- Properties
    
    @NSManaged public var key: String
    @NSManaged public var value: String?
    
    // MARK:- Relations
    
    @NSManaged public var owner: LocalizationMO
    
}
