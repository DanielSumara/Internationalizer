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
    
    // MARK:- Lifecicle
    
}

extension StringsGridViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 13
    }
    
}

extension StringsGridViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = FieldCell.dequeue(from: tableView, for: self) as FieldCell
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 22
    }
    
}
