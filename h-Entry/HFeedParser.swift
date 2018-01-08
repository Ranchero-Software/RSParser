//
//  HFeedParser.swift
//  RSParser
//
//  Created by Jared Sorge on 1/7/18.
//  Copyright © 2018 Ranchero Software, LLC. All rights reserved.
//

import Foundation

// http://microformats.org/wiki/h-feed

public final class HFeedParser: NSObject {
    public static func parse(_ parserData: ParserData) -> ParsedFeed? {
        let parser = HFeedParser()
        if let rsParsedFeed = parser.parse(parserData) {
            return RSParsedFeedTransformer.parsedFeed(rsParsedFeed)
        }
        return nil
    }
    
    private func parse(_ parserData: ParserData) -> RSParsedFeed? {
        let parser = RSSAXHTMLParser(delegate: self)
        parser.parseData(parserData.data)
        parser.finishParsing()
        return nil
    }
}

public struct HFeed {
    public let name: String
    public let author: HCard
    public let url: URL
    public let photo: Data?
    public let children = [HEntry]()
}
