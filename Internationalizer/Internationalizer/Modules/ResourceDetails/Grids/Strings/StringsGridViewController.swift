//
//  StringsGridViewController.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 19.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class StringsGridViewController: NSViewController {
    
    // MARK:- @IBOutlets
    
    @IBOutlet weak var tableView: NSTableView!
    
    // MARK:- Properties
    
    var viewModel: StringsGridViewModel! {
        didSet {
            viewModel.view = self
            reload()
        }
    }
    
    // MARK:- Lifecicle
    
}

extension StringsGridViewController: StringsGridView {
    
    func reload() {
        guard isViewLoaded else { return }
        
        tableView.beginUpdates()
        for column in tableView.tableColumns {
            tableView.removeTableColumn(column)
        }
        
        let columnWidh = (view.bounds.width - 12) / CGFloat(viewModel.numberOfColumns)
        for index in 0 ..< viewModel.numberOfColumns {
            let columnTitle = viewModel.titleForColumn(at: index)
            let column = NSTableColumn(identifier: columnTitle)
            column.resizingMask = [.autoresizingMask, .userResizingMask]
            column.minWidth = 160
            column.width = columnWidh
            column.title = columnTitle
            
            tableView.addTableColumn(column)
        }
        
        tableView.removeRows(at: IndexSet(integersIn: 0 ..< tableView.numberOfRows), withAnimation: .effectFade)
        tableView.insertRows(at: IndexSet(integersIn: 0 ..< viewModel.numberOfItems), withAnimation: .effectFade)
        tableView.endUpdates()
    }
    
}

extension StringsGridViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int { return viewModel.numberOfItems }
    
}

extension StringsGridViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let column = tableColumn else { return nil }
        
        let cell = FieldCell.dequeue(from: tableView, for: self) as FieldCell
        cell.textField?.stringValue = viewModel.value(for: column.identifier, at: row) ?? ""
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat { return 22 }
    
}
