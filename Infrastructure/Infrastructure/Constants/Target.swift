//
//  Target.swift
//  Infrastructure
//
//  Created by Daniel Sumara on 02.04.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public enum Target {
    
    // MARK:- Properties
    
    public static internal(set) var current: Target = .develop
    
    // MARK:- Cases
    
    case appstore
    case develop
    
    case britishStoct
    case usStockMarket
    
}
