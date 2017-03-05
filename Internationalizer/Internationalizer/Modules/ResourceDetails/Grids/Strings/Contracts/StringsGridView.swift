//
//  StringsGridView.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 28.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Infrastructure

protocol StringsGridView: MvvmView {
    
    // MARK:- Properties
    
    var viewModel: StringsGridViewModel! { get set }
    
    // MARK:- API
    
}
