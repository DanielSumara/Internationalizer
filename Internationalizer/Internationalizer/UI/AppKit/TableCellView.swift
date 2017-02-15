//
//  TableCellView.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 15.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

public class TableCellView: NSTableCellView {
    
    // MARK:- Properties
    
}

public extension TableCellView {
    
    public static var typeIdentifier: String { return String(describing: self) }
    
    public static func dequeue<CellType: TableCellView>(from outlineView: NSOutlineView, for parent: NSViewController) -> CellType {
        return outlineView.make(withIdentifier: typeIdentifier, owner: parent) as! CellType
    }
    
}
