//
//  FetchRequest.swift
//  Models
//
//  Created by Daniel Sumara on 25.03.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class FetchRequest<FetchRequestResult: NSManagedObject>: NSFetchRequest<NSFetchRequestResult> {
    
    // MARK:- Lifecycle
    
    init(for type: FetchRequestResult.Type) {
        super.init()
        entity = type.entity()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
