//
//  RSParsedMediaContent.h
//  RSParser
//  
//
//  Created by Marcelo Perretta on 07/04/2022.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface RSParsedMediaContent : NSObject

@property (nonatomic) NSString *url;
@property (nonatomic, nullable) NSString *mimeType;

@end

NS_ASSUME_NONNULL_END
