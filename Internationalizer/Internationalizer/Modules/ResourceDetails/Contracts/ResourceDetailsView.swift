//
//  ResourceDetailsView.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

protocol ResourceDetailsView: MvvmView {
    
    func showLackOfSelection()
    func showDetails(for resource: Resource)
    
}
