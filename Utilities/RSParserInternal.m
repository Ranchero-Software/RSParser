//
//  RSParserInternal.m
//  RSParser
//
//  Created by Brent Simmons on 12/26/16.
//  Copyright © 2016 Ranchero Software, LLC. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <RSParser/RSParserInternal.h>


static BOOL RSParserIsNil(id obj) {
	
	return obj == nil || obj == [NSNull null];
}

BOOL RSParserObjectIsEmpty(id obj) {
	
	if (RSParserIsNil(obj)) {
		return YES;
	}
	
	if ([obj respondsToSelector:@selector(count)]) {
		return [obj count] < 1;
	}
	
	if ([obj respondsToSelector:@selector(length)]) {
		// Have to cast obj to something specific to quiet "multiple methods named"
		// errors arising from importing Swift module. Whether obj is actually a
		// string or not doesn't matter to the Objective-C runtime, so long as it
		// implements -length.
		return [(NSString*)obj length] < 1;
	}
	
	return NO; /*Shouldn't get here very often.*/
}

BOOL RSParserStringIsEmpty(NSString *s) {
	
	return RSParserIsNil(s) || s.length < 1;
}

