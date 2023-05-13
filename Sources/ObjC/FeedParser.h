//
//  FeedParser.h
//  RSXML
//
//  Created by Brent Simmons on 7/12/15.
//  Copyright © 2015 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@class RSParsedFeed;
@class RSXMLData;


@protocol FeedParser <NSObject>

+ (BOOL)canParseFeed:(RSXMLData *)xmlData;

- (instancetype)initWithXMLData:(RSXMLData *)xmlData;

- (nullable RSParsedFeed *)parseFeed:(NSError **)error;


@end

NS_ASSUME_NONNULL_END
