//
//  RSParsedFeed.h
//  RSParser
//
//  Created by Brent Simmons on 7/12/15.
//  Copyright © 2015 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

@class RSParsedArticle;

NS_ASSUME_NONNULL_BEGIN

@interface RSParsedFeed : NSObject

- (instancetype)initWithURLString:(NSString *)urlString title:(NSString * _Nullable)title link:(NSString * _Nullable)link language:(NSString * _Nullable)language articles:(NSArray <RSParsedArticle *>*)articles;

@property (nonatomic, readonly) NSString *urlString;
@property (nonatomic, readonly, nullable) NSString *title;
@property (nonatomic, readonly, nullable) NSString *link;
@property (nonatomic, readonly, nullable) NSString *language;
@property (nonatomic, readonly) NSSet <RSParsedArticle *>*articles;

@end

NS_ASSUME_NONNULL_END
