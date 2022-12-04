//
//  RSParsedArticle.h
//  RSParser
//
//  Created by Brent Simmons on 12/6/14.
//  Copyright (c) 2014 Ranchero Software LLC. All rights reserved.
//

@import Foundation;

@class RSParsedEnclosure;
@class RSParsedAuthor;

NS_ASSUME_NONNULL_BEGIN

@interface RSParsedArticle : NSObject

- (instancetype)initWithFeedURL:(NSString *)feedURL;

@property (nonatomic, readonly) NSString *feedURL;
@property (nonatomic) NSString *articleID; //guid, if present, or calculated from other attributes. Should be unique to the feed, but not necessarily unique across different feeds. (Not suitable for a database ID.)

@property (nonatomic, nullable) NSString *guid;
@property (nonatomic, nullable) NSString *title;
@property (nonatomic, nullable) NSString *body;
@property (nonatomic, nullable) NSString *link;
@property (nonatomic, nullable) NSString *permalink;
@property (nonatomic, nullable) NSSet<RSParsedAuthor *> *authors;
@property (nonatomic, nullable) NSSet<RSParsedEnclosure *> *enclosures;
@property (nonatomic, nullable) NSDate *datePublished;
@property (nonatomic, nullable) NSDate *dateModified;
@property (nonatomic) NSDate *dateParsed;
@property (nonatomic, nullable)	NSString *language;

- (void)addEnclosure:(RSParsedEnclosure *)enclosure;
- (void)addAuthor:(RSParsedAuthor *)author;

@end

NS_ASSUME_NONNULL_END
