//
//  ManagedObjectContext.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class ManagedObjectContext: NSManagedObjectContext {
    
    // MARK:- API
    
    func fetch<ResultType: NSManagedObject>(using request: FetchRequest<ResultType>) -> [ResultType] {
        do {
            if let result = try super.fetch(request) as? [ResultType] {
                return result
            } else {
                print("Error: cannot cast \(request) result to: \(ResultType.self)")
            }
        } catch {
            print(error)
        }
        return []
    }
    
}
