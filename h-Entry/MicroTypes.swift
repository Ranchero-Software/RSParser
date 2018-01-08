//
//  MicroTypes.swift
//  RSParser
//
//  Created by Jared Sorge on 1/6/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

public struct HCard: HEntryLocation {
    
}

public struct HAdr: HEntryLocation {
    
}

public struct HGeo: HEntryLocation {
    
}

public struct HRSVP {
    
}

public struct HCite {
    let name: String?
    let datePublished: Date?
    let author: HCard?
    let url: URL?
    let uid: String?
}
