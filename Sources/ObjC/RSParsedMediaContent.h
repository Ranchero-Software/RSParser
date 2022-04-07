//
//  RSParsedMediaContent.h
//  RSParser
//  
//
//  Created by Marcelo Perretta on 07/04/2022.
//

@import Foundation;
#import "RSParsedMediaDescription.h"
#import "RSParsedMediaCredit.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSParsedMediaContent : NSObject

@property (nonatomic) NSString *url;
@property (nonatomic, nullable) NSString *mimeType;
@property (nonatomic, nullable) RSParsedMediaDescription *mediaDescription;
@property (nonatomic, nullable) RSParsedMediaCredit *mediaCredit;

@end

NS_ASSUME_NONNULL_END
