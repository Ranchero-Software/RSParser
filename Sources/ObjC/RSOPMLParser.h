//
//  RSOPMLParser.h
//  RSParser
//
//  Created by Brent Simmons on 7/12/15.
//  Copyright © 2015 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;


@class ParserData;
@class RSOPMLDocument;

NS_ASSUME_NONNULL_BEGIN

typedef void (^OPMLParserCallback)(RSOPMLDocument * _Nullable opmlDocument, NSError * _Nullable error);

// Parses on background thread; calls back on main thread.
void RSParseOPML(ParserData *parserData, OPMLParserCallback callback);


@interface RSOPMLParser: NSObject

+ (nullable RSOPMLDocument *)parseOPMLWithParserData:(ParserData *)parserData error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
