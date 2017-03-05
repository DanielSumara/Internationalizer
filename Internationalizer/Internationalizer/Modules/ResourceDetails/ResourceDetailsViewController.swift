//
//  ResourceDetailsViewController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Models

class ResourceDetailsViewController: NSTabViewController {
 
    // MARK:- Properties
    
    weak var lackOfSelection: NSViewController!
    weak var stringsGrid: StringsGridViewController!
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lackOfSelection = tabViewItems[ViewControllerIndexFor.lackOfSelection].viewController
        stringsGrid = tabViewItems[ViewControllerIndexFor.stringsGrid].viewController as! StringsGridViewController
    }
    
}

extension ResourceDetailsViewController: ResourceDetailsView {
    
    func reload() {
        
    }
    
    func showLackOfSelection() {
        selectedTabViewItemIndex = ViewControllerIndexFor.lackOfSelection
    }
    
    func showDetails(for resource: Resource) {
        switch resource.kind {
        case .storyboard: selectedTabViewItemIndex = 0
        case .strings:
            stringsGrid.viewModel = StringsGridViewModel(from: resource)
            selectedTabViewItemIndex = ViewControllerIndexFor.stringsGrid
        case .xib: selectedTabViewItemIndex = 0
        }
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
