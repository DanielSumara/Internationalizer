//
//  ProjectsListViewController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Infrastructure
import UI

class ProjectsListViewController: NSViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    // MARK:- Properties
    
    var viewModel: ProjectsListViewModel! {
        didSet {
            viewModel.view = self
            reload()
        }
    }
    
    // MARK:- Lifecycle
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        reload()
        outlineView.expandItem(nil, expandChildren: true)
    }
    
    // MARK:- @IBActions
    
    @IBAction func addNewResourcesTapped(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.title = "Choose xCode project"
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["xcodeproj"]
        openPanel.beginSheetModal(for: view.window!) { [weak self, weak openPanel] response in
            guard response == NSFileHandlingPanelOKButton else { return }
            guard let ss = self, let op = openPanel, let url = op.urls.first else { return }
            ss.viewModel.addProject(from: url)
        }
    }
    
}

extension ProjectsListViewController: ProjectsListView {
    
    func reload() {
        guard viewModel != nil else { return }
        
        outlineView.reloadData()
    }
    
    func insert(project: ProjectViewModel, at index: Int) {
        outlineView.insertItems(at: IndexSet(integer: index), inParent: nil, withAnimation: .slideDown)
        DispatchQueue.main.async { [weak self] in
            guard let ss = self else { return }
            ss.outlineView.expandItem(project)
        }
    }
    
}

extension ProjectsListViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard viewModel != nil else { return 0 }
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
        
        guard let navigatorItem = item as? NavigatorItem else { fatalError() }
        
        view.textField?.stringValue = navigatorItem.name
        view.imageView?.image = navigatorItem.icon
        
        return view
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView else { return }
        viewModel.showDetails(for: outlineView.item(atRow: outlineView.selectedRow))
    }
    
}
