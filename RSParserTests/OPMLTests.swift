//
//  OPMLTests.swift
//  RSParser
//
//  Created by Brent Simmons on 6/25/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

import XCTest
import CoreGraphics
@testable import RSParser

class OPMLTests: XCTestCase {

	let subsData = parserData("Subs", "opml", "http://example.org/")

	func testOPMLParsingPerformance() {

		// 0.002 sec on my 2012 iMac.
		self.measure {
			let _ = try! RSOPMLParser.parseOPML(with: self.subsData)
		}
	}

	func testNotOPML() {

		let d = parserData("DaringFireball", "rss", "http://daringfireball.net/")
		XCTAssertThrowsError(try RSOPMLParser.parseOPML(with: d))
	}

	func testSubsStructure() {

		let opmlDocument = try! RSOPMLParser.parseOPML(with: subsData)
		recursivelyCheckOPMLStructure(opmlDocument)
	}

	func recursivelyCheckOPMLStructure(_ item: RSOPMLItem) {

		let feedSpecifier = item.feedSpecifier
		if !(item is RSOPMLDocument) {
			XCTAssertNotNil((item.attributes! as NSDictionary).opml_text)
		}

		// If it has no children, it should have a feed specifier. The converse is also true.
		var isFolder = item.children != nil && item.children!.count > 0
		if !isFolder && (item.attributes! as NSDictionary).opml_title == "Skip" {
			isFolder = true
		}

		if !isFolder {
			XCTAssertNotNil(feedSpecifier!.title)
			XCTAssertNotNil(feedSpecifier!.feedURL)
		}
		else {
			XCTAssertNil(feedSpecifier)
			if !(item is RSOPMLDocument) {
				XCTAssertNotNil((item.attributes! as NSDictionary).opml_title)
			}
		}

		if item.children != nil && item.children!.count > 0 {
			for oneItem in item.children! {
				recursivelyCheckOPMLStructure(oneItem)
			}
		}
	}
}
