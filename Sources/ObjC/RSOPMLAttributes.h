//
//  RSOPMLAttributes.h
//  RSParser
//
//  Created by Brent Simmons on 2/28/16.
//  Copyright © 2016 Ranchero Software, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

// OPML allows for arbitrary attributes.
// These are the common attributes in OPML files used as RSS subscription lists.

extern NSString *OPMLTextKey; //text
extern NSString *OPMLTitleKey; //title
extern NSString *OPMLDescriptionKey; //description
extern NSString *OPMLTypeKey; //type
extern NSString *OPMLVersionKey; //version
extern NSString *OPMLHMTLURLKey; //htmlUrl
extern NSString *OPMLXMLURLKey; //xmlUrl


@interface NSDictionary (RSOPMLAttributes)

// A frequent error in OPML files is to mess up the capitalization,
// so these do a case-insensitive lookup.

@property (nonatomic, nullable, readonly) NSString *opml_text;
@property (nonatomic, nullable, readonly) NSString *opml_title;
@property (nonatomic, nullable, readonly) NSString *opml_description;
@property (nonatomic, nullable, readonly) NSString *opml_type;
@property (nonatomic, nullable, readonly) NSString *opml_version;
@property (nonatomic, nullable, readonly) NSString *opml_htmlUrl;
@property (nonatomic, nullable, readonly) NSString *opml_xmlUrl;

@end

NS_ASSUME_NONNULL_END
