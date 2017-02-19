//
//  ProjectsListView.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

protocol ProjectsListView: MvvmView {
    
    func insert(project: ProjectViewModel, at index: Int)
    
}
