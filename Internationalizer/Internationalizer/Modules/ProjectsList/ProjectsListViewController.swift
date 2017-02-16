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
    
    // MARK:- Lifecycle
    
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
        guard let item = item else { return viewModel.numberOfChilds }
        guard let dataContext = item as? OutlineDataContext else { return 0 }
        return dataContext.numberOfChilds
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let item = item else { return viewModel.child(at: index) }
        guard let dataContext = item as? OutlineDataContext else { fatalError() }
        return dataContext.child(at: index)
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let dataContext = item as? OutlineDataContext else { return false }
        return dataContext.isExpandable
    }
    
}

extension ProjectsListViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let view = TableCellView.dequeue(from: outlineView, for: self) as TableCellView
        
        switch item {
        case let project as ProjectViewModel: view.textField?.stringValue = project.name
        case let resource as ResourceViewModel: view.textField?.stringValue = resource.name
        default: fatalError()
        }
        
        return view
    }
    
}
