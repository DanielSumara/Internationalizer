//
//  TargetConfiguration.swift
//  Infrastructure
//
//  Created by Daniel Sumara on 02.04.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

public extension Configuration {
    
    /// Configuration API for Target enum
    public struct Target {
        
        /// This method setup **Turget.currnet** property to new value
        ///
        /// This method should be used only in AppDelegate class
        /// to provide current configuration
        /// To change target value for purpose of test use:
        ///
        /// **Configuration.Target.set(as: Target)**
        ///
        /// That method will prompt worning in xCode
        ///
        /// - Parameter target: new value
        public static func setup(as target: Infrastructure.Target) {
            Infrastructure.Target.current = target
        }
        
        
        /// This method setup Turget.currnet property to new value
        ///
        /// This method is designed only for purpose of debuging and 
        /// shouldn't be used in production code
        ///
        /// - Parameter target: new value
        @available(*, deprecated, message: "This method is allowed only for purpose of testing/debuging - shoudn't appear in production code")
        public static func set(as target: Infrastructure.Target) {
            Infrastructure.Target.current = target
        }
        
    }
    
}
