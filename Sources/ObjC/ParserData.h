//
//  ParserData.h
//  RSParser
//
//  Created by Brent Simmons on 10/4/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface ParserData : NSObject

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSData *data;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithURL:(NSString *)url data:(NSData *)data NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

