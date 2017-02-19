//
//  InternationalizerViewsController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class InternationalizerViewsController: NSSplitViewController {
    
    // MARK:- Properties
    
    fileprivate weak var projectsList: ProjectsListViewController!
    fileprivate weak var resourceDetails: ResourceDetailsViewController!
    
    // MARK:- Infrastructure
    
    fileprivate var coordinator: RootCoordinator!
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectsList = splitViewItems[ViewControllerIndexFor.list].viewController as! ProjectsListViewController
        resourceDetails = splitViewItems[ViewControllerIndexFor.details].viewController as! ResourceDetailsViewController
        
        coordinator = RootCoordinator(with: projectsList, and: resourceDetails)
        coordinator.start()
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        splitView.setPosition(280, ofDividerAt: 0)
    }
    
}

extension InternationalizerViewsController {
    
    fileprivate enum ViewControllerIndexFor {
        
        static let list: Int = 0
        static let details: Int = 1
        
    }
    
}
