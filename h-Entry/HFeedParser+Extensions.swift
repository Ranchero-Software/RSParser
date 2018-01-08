//
//  HFeedParser+Extensions.swift
//  RSParser
//
//  Created by Jared Sorge on 1/7/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

extension HFeedParser: RSSAXHTMLParserDelegate {
    public func saxParser(_ SAXParser: RSSAXHTMLParser, xmlStartElement localName: UnsafePointer<UInt8>, attributes: UnsafeMutablePointer<UnsafePointer<UInt8>?>?) {
        let attributeNames = SAXParser.attributesDictionary(attributes)
        let knownElements = attributeNames?.keys.flatMap { HFeedProperty(rawValue: String(describing: $0)) }
        guard let elements = knownElements, elements.count > 0 else { return }
        print("started \(elements)")
    }
    
    public func saxParser(_ SAXParser: RSSAXHTMLParser, xmlEndElement localName: UnsafePointer<UInt8>?) {
        print("ended element")
    }
}

enum HFeedProperty: String {
    case name = "p-name"
    case author = "p-author"
    case url = "u-url"
    case photo = "u-photo"
}
