//
//  NSData+RSParser.h
//  RSParser
//
//  Created by Brent Simmons on 6/24/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;


@interface NSData (RSParser)

- (BOOL)rsparser_isProbablyHTML;
- (BOOL)rsparser_isProbablyXML;
- (BOOL)rsparser_isProbablyJSON;

- (BOOL)rsparser_isProbablyJSONFeed;
- (BOOL)rsparser_isProbablyRSSInJSON;
- (BOOL)rsparser_isProbablyRSS;
- (BOOL)rsparser_isProbablyAtom;

@end



