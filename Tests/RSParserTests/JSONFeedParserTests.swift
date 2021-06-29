//
//  JSONFeedParserTests.swift
//  RSParser
//
//  Created by Brent Simmons on 6/26/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

import XCTest
import RSParser

class JSONFeedParserTests: XCTestCase {

	func testInessentialPerformance() {

		// 0.001 sec on my 2012 iMac.
		let d = parserData("inessential", "json", "http://inessential.com/")
		self.measure {
			let _ = try! FeedParser.parse(d)
		}
	}

	func testDaringFireballPerformance() {

		// 0.009 sec on my 2012 iMac.
		let d = parserData("DaringFireball", "json", "http://daringfireball.net/")
		self.measure {
			let _ = try! FeedParser.parse(d)
		}
	}

	func testGettingFaviconAndIconURLs() {

		let d = parserData("DaringFireball", "json", "http://daringfireball.net/")
		let parsedFeed = try! FeedParser.parse(d)!

		XCTAssert(parsedFeed.faviconURL == "https://daringfireball.net/graphics/favicon-64.png")
		XCTAssert(parsedFeed.iconURL == "https://daringfireball.net/graphics/apple-touch-icon.png")
	}

	func testAllThis() {

		let d = parserData("allthis", "json", "http://leancrew.com/allthis/")
		let parsedFeed = try! FeedParser.parse(d)!

		XCTAssertEqual(parsedFeed.items.count, 12)
	}

	func testCurt() {
		
		let d = parserData("curt", "json", "http://curtclifton.net/")
		let parsedFeed = try! FeedParser.parse(d)!

		XCTAssertEqual(parsedFeed.items.count, 26)

		var didFindTwitterQuitterArticle = false
		for article in parsedFeed.items {
			if article.title == "Twitter Quitter" {
				didFindTwitterQuitterArticle = true
				XCTAssertTrue(article.contentHTML!.hasPrefix("<p>I&#8217;ve decided to close my Twitter account. William Van Hecke <a href=\"https://tinyletter.com/fet/letters/microcosmographia-xlxi-reasons-to-stay-on-twitter\">makes a convincing case</a>"))
			}
		}

		XCTAssertTrue(didFindTwitterQuitterArticle)
	}

	func testPixelEnvy() {

		let d = parserData("pxlnv", "json", "http://pxlnv.com/")
		let parsedFeed = try! FeedParser.parse(d)!
		XCTAssertEqual(parsedFeed.items.count, 20)

	}

	func testRose() {
		let d = parserData("rose", "json", "http://www.rosemaryorchard.com/")
		let parsedFeed = try! FeedParser.parse(d)!
		XCTAssertEqual(parsedFeed.items.count, 84)
	}

	func test3960() {
		let d = parserData("3960", "json", "http://journal.3960.org/")
		let parsedFeed = try! FeedParser.parse(d)!
		XCTAssertEqual(parsedFeed.items.count, 20)
		XCTAssertEqual(parsedFeed.language, "de-DE")
		
		for item in parsedFeed.items {
			XCTAssertEqual(item.language, "de-DE")
		}
	}

	func testAuthors() {
		let d = parserData("authors", "json", "https://example.com/")
		let parsedFeed = try! FeedParser.parse(d)!
		XCTAssertEqual(parsedFeed.items.count, 4)

		let rootAuthors = Set([
			ParsedAuthor(name: "Root Author 1", url: nil, avatarURL: nil, emailAddress: nil),
			ParsedAuthor(name: "Root Author 2", url: nil, avatarURL: nil, emailAddress: nil)
		])
		let itemAuthors = Set([
			ParsedAuthor(name: "Item Author 1", url: nil, avatarURL: nil, emailAddress: nil),
			ParsedAuthor(name: "Item Author 2", url: nil, avatarURL: nil, emailAddress: nil)
		])
		let legacyItemAuthors = Set([
			ParsedAuthor(name: "Legacy Item Author", url: nil, avatarURL: nil, emailAddress: nil)
		])

		XCTAssertEqual(parsedFeed.authors?.count, 2)
		XCTAssertEqual(parsedFeed.authors, rootAuthors)

		let noAuthorsItem = parsedFeed.items.first { $0.uniqueID == "Item without authors" }!
		XCTAssertEqual(noAuthorsItem.authors, nil)

		let legacyAuthorItem = parsedFeed.items.first { $0.uniqueID == "Item with legacy author" }!
		XCTAssertEqual(legacyAuthorItem.authors, legacyItemAuthors)

		let modernAuthorsItem = parsedFeed.items.first { $0.uniqueID == "Item with modern authors" }!
		XCTAssertEqual(modernAuthorsItem.authors, itemAuthors)

		let bothAuthorsItem = parsedFeed.items.first { $0.uniqueID == "Item with both" }!
		XCTAssertEqual(bothAuthorsItem.authors, itemAuthors)
	}

	func testExtensions() {
		let d = parserData("jsonfeed-extension", "json", "https://example.com/")
		let parsedFeed = try! FeedParser.parse(d)!

		XCTAssertEqual(parsedFeed.extensions?.count, 1)

		let nonexistentExtension = parsedFeed.extensions?["_nonexistent"]
		XCTAssertNil(nonexistentExtension)

		let feedExtension = parsedFeed.extensions!["_contoso"]!
		XCTAssertEqual(feedExtension.name, "_contoso")
        
        // Test content access
		XCTAssertEqual(feedExtension["about"], "Contoso JSON feed extension. There is actually no such extension in real life. This file just tests if the JSONFeed parser can parse a feed with JSON Feed extensions.")
		XCTAssertEqual(feedExtension["someNumber"], 42)
		XCTAssertEqual(feedExtension["someBool"], true)
		XCTAssertEqual(feedExtension["someString"], "Hello Contoso")
        
		let chronologicalItems = parsedFeed.items.sorted { $0.datePublished! > $1.datePublished! }

		let itemExtension = chronologicalItems[0].extensions!["_contoso"]!
		XCTAssertEqual(itemExtension.name, "_contoso")
		XCTAssertEqual(itemExtension["someKey"], "SomeValue2")
		XCTAssertEqual(itemExtension["someBoolKey"], true)
		XCTAssertEqual(itemExtension["anotherKey"], "AnotherValue2")
        
        XCTAssertEqual(itemExtension["someKey"], "SomeValue2")

		let secondItemExtension = chronologicalItems[1].extensions!["_contoso"]!
		XCTAssertEqual(secondItemExtension["someBoolKey"], false)
		XCTAssertEqual(secondItemExtension["someIntKey"], 43)

		let thirdItemExtensions = chronologicalItems[2].extensions
		XCTAssertNil(thirdItemExtensions)
	}
}
