//
//  RSParsedEnclosure.m
//  RSParser
//
//  Created by Brent Simmons on 12/18/17.
//  Copyright © 2017 Ranchero Software, LLC. All rights reserved.
//

#import "RSParsedEnclosure.h"

@implementation RSParsedEnclosure

- (instancetype)initWithURLString:(NSString *)urlString {

	self = [super init];
	if (!self) {
		return nil;
	}

	_url = urlString;

	return self;
}

@end
