//
//  FieldCell.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 20.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import AppKit

class FieldCell: TableCellView {
    
    // MARK:- Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView?.toolTip = "Value is missing"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    
        textField?.stringValue = ""
        imageView?.isHidden = true
    }
    
    // MARK:- API
    
    var value: String? { didSet { reload() } }
    
}

extension FieldCell: MvvmView {
    
    func reload() {
        textField?.stringValue = value ?? ""
        imageView?.isHidden = value != nil
    }
    
}
