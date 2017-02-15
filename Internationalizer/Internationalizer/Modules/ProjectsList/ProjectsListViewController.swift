//
//  ProjectsListViewController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class ProjectsListViewController: NSViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    // MARK:- Properties
    
    var viewModel: ProjectsListViewModel! = ProjectsListViewModel() { didSet { reload() } }
    
    // MARK:- Lifecicle
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        reload()
    }
    
}

extension ProjectsListViewController {
    
    func reload() {
        guard isViewLoaded else { return }
        
        outlineView.reloadData()
    }
    
}

extension ProjectsListViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard let item = item else { return viewModel.numberOfProjects }
        guard let project = item as? Project else { return 0 }
        return viewModel.numberOfResources(in: project)
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let item = item else { return viewModel.project(for: index) }
        guard let project = item as? Project else { fatalError() }
        return viewModel.resource(for: index, from: project)
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let project = item as? Project else { return false }
        return !project.resources.isEmpty
    }
    
}

extension ProjectsListViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let view = TableCellView.dequeue(from: outlineView, for: self) as TableCellView
        
        switch item {
        case let project as Project: view.textField?.stringValue = project.name
        case let resource as Resource: view.textField?.stringValue = resource.name
        default: fatalError()
        }
        
        return view
    }
    
}
