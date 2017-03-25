//
//  NumericType.swift
//  Networking
//
//  Created by Daniel Sumara on 11.01.2017.
//  Copyright © 2017 FarmaProm. All rights reserved.
//

import Foundation

protocol NumericType { }

extension Double: NumericType { }
extension Float: NumericType { }
extension Int: NumericType { }
extension Int8: NumericType { }
extension Int16: NumericType { }
extension Int32: NumericType { }
extension Int64: NumericType { }
extension UInt: NumericType { }
extension UInt8: NumericType { }
extension UInt16: NumericType { }
extension UInt32: NumericType { }
extension UInt64: NumericType { }
