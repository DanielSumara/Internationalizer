//
//  TableCellView.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

open class TableCellView: NSTableCellView {
    
    // MARK:- Properties
    
}

public extension TableCellView {
    
    public static var typeIdentifier: String { return String(describing: self) }
    
    public static func dequeue<CellType: TableCellView>(from tableView: NSTableView, for parent: NSViewController) -> CellType {
        return tableView.make(withIdentifier: typeIdentifier, owner: parent) as! CellType
    }
    
}
