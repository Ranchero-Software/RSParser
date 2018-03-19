//
//  Compatibility.swift
//  RSParser
//
//  Created by Cameron Pulsford on 3/19/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

internal extension Sequence {

    #if swift(>=4.1)
    #else
    func compactMap<U>(_ transform: (Element) throws -> U?) rethrows -> [U] {
        return try flatMap(transform)
    }
    #endif
}
