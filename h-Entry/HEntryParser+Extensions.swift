//
//  HEntryParser+Extensions.swift
//  RSParser
//
//  Created by Jared Sorge on 1/6/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

private enum HEntryProperty: String {
    case name = "p-name"
    case summary = "p-summary"
    case content = "e-content"
    case published = "dt-published"
    case author = "p-author"
    case category = "p-category"
    case url = "u-url"
    case uid = "u-uid"
    case location = "p-location"
    case syndication = "u-syndication"
    case inReplyTo = "u-in-reply-to"
    case rsvp = "p-rsvp" // the contents of this tag are an enum: yes, maybe, no, interested
    case likeOf = "u-like-of"
    case repostOf = "u-repost-of"
}

extension HEntryParser: RSSAXHTMLParserDelegate {
    public func saxParser(_ SAXParser: RSSAXHTMLParser, xmlStartElement localName: UnsafePointer<UInt8>, attributes: UnsafeMutablePointer<UnsafePointer<UInt8>?>?) {
        print("found something")
    }
    
    public func saxParser(_ SAXParser: RSSAXHTMLParser, xmlEndElement localName: UnsafePointer<UInt8>?) {
        print("ended something")
    }
}

