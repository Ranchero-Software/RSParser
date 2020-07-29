//
//  RSParser.h
//  RSParser
//
//  Created by Brent Simmons on 6/20/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

#if SWIFT_PACKAGE
#import "ParserData.h"
#import "RSDateParser.h"

// OPML

#import "RSOPMLParser.h"
#import "RSOPMLDocument.h"
#import "RSOPMLItem.h"
#import "RSOPMLAttributes.h"
#import "RSOPMLFeedSpecifier.h"
#import "RSOPMLError.h"

// For writing your own XML parser.

#import "RSSAXParser.h"

// You should use FeedParser (Swift) instead of these two specific parsers
// and the objects they create.
// But they’re available if you want them.

#import "RSRSSParser.h"
#import "RSAtomParser.h"
#import "RSParsedFeed.h"
#import "RSParsedArticle.h"
#import "RSParsedEnclosure.h"
#import "RSParsedAuthor.h"

// HTML

#import "RSHTMLMetadataParser.h"
#import "RSHTMLMetadata.h"
#import "RSHTMLLinkParser.h"
#import "RSSAXHTMLParser.h" // For writing your own HTML parser.
#import "RSHTMLTag.h"

// Utilities

#import "NSData+RSParser.h"
#import "NSString+RSParser.h"
#else
// To parse RSS, Atom, JSON Feed, and RSS-in-JSON the easy way, see FeedParser.swift.

#import <RSParser_ObjC/ParserData.h>

// Dates

#import <RSParser_ObjC/RSDateParser.h>

// OPML

#import <RSParser_ObjC/RSOPMLParser.h>
#import <RSParser_ObjC/RSOPMLDocument.h>
#import <RSParser_ObjC/RSOPMLItem.h>
#import <RSParser_ObjC/RSOPMLAttributes.h>
#import <RSParser_ObjC/RSOPMLFeedSpecifier.h>
#import <RSParser_ObjC/RSOPMLError.h>

// For writing your own XML parser.

#import <RSParser_ObjC/RSSAXParser.h>

// You should use FeedParser (Swift) instead of these two specific parsers
// and the objects they create.
// But they’re available if you want them.

#import <RSParser_ObjC/RSRSSParser.h>
#import <RSParser_ObjC/RSAtomParser.h>
#import <RSParser_ObjC/RSParsedFeed.h>
#import <RSParser_ObjC/RSParsedArticle.h>
#import <RSParser_ObjC/RSParsedEnclosure.h>
#import <RSParser_ObjC/RSParsedAuthor.h>

// HTML

#import <RSParser_ObjC/RSHTMLMetadataParser.h>
#import <RSParser_ObjC/RSHTMLMetadata.h>
#import <RSParser_ObjC/RSHTMLLinkParser.h>
#import <RSParser_ObjC/RSSAXHTMLParser.h> // For writing your own HTML parser.
#import <RSParser_ObjC/RSHTMLTag.h>

// Utilities

#import <RSParser_ObjC/NSData+RSParser.h>
#import <RSParser_ObjC/NSString+RSParser.h>
#endif




