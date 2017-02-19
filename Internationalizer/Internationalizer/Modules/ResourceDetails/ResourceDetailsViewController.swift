//
//  ResourceDetailsViewController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class ResourceDetailsViewController: NSTabViewController {
 
    // MARK:- Properties
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionOptions = .slideLeft
    }
    
    
}

extension ResourceDetailsViewController: ResourceDetailsView {
    
    func reload() {
        
    }
    
    func showLackOfSelection() {
        selectedTabViewItemIndex = ViewControllerIndexFor.lackOfSelection
    }
    
    func showDetails(for resource: NSObject) {
        selectedTabViewItemIndex = ViewControllerIndexFor.stringsGrid
    }
    
}

extension ResourceDetailsViewController {
    
    fileprivate enum ViewControllerIndexFor {
        
        static let lackOfSelection: Int = 0
        static let stringsGrid: Int = 1
        static let storyboardGrid: Int = 1
        static let xibGrid: Int = 1
        
    }
    
}
