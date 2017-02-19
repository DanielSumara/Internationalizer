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
    
    // MARK:- Infrastructure
    
    fileprivate var projectRepository: ProjectsRepository = ProjectsRepository()
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectsList = splitViewItems[0].viewController as! ProjectsListViewController
        projectsList.viewModel = ProjectsListViewModel(from: projectRepository)
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        splitView.setPosition(280, ofDividerAt: 0)
    }
    
}
