//
//  RSOPMLDocument.h
//  RSParser
//
//  Created by Brent Simmons on 2/28/16.
//  Copyright © 2016 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

#import "RSOPMLItem.h"



NS_ASSUME_NONNULL_BEGIN

@interface RSOPMLDocument : RSOPMLItem

@property (nonatomic, nullable) NSString *title;
@property (nonatomic, nullable) NSString *url;

@end

NS_ASSUME_NONNULL_END
