//
//  HEntryParser.swift
//  RSParser
//
//  Created by Jared Sorge on 1/5/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

// http://microformats.org/wiki/h-entry

public final class HEntryParser: NSObject {
    public static func parse(_ parserData: ParserData) -> ParsedItem? {
        return nil
    }
    
    private func parse(_ parserData: ParserData) -> RSParsedArticle? {
        let parser = RSSAXHTMLParser(delegate: self)
        parser.parseData(parserData.data)
        parser.finishParsing()
        return nil
    }
}

public protocol HEntryLocation {}

public final class HEntry {
    public var name: String?
    public var summary: String?
    public var content: String?
    public var published: Date?
    public var author = [HCard]()
    public var category = [String]()
    public var url: URL?
    public var uid: String?
    public var location: HEntryLocation?
    public var syndication = [URL]()
    public var inReplyTo: HCite?
    public var rsvp: HRSVP?
    public var likeOf: HCite?
    public var repostOf: HCite?
}
