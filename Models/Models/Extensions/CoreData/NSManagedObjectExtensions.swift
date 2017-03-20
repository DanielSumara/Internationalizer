//
//  NSManagedObjectExtensions.swift
//  Models
//
//  Created by Daniel Sumara on 20.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import CoreData

extension NSManagedObject {
    
    static func getRequest<RequestedObjectType: NSManagedObject>() -> NSFetchRequest<RequestedObjectType> {
        return NSFetchRequest<RequestedObjectType>(entityName: String(describing: RequestedObjectType.self))
    }
    
}
