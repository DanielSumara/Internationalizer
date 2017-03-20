//
//  OperationResult.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

public enum OperationResult<ResultType> {
    
    case success(with: ResultType)
    case failure(with: Error)
    
}
