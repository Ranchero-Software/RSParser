//
//  RSParsedMediaCredit.h
//  RSParser
//
//
//  Created by Marcelo Perretta on 07/04/2022.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface RSParsedMediaCredit : NSObject

@property (nonatomic, nullable) NSString *mediaCreditRole;
@property (nonatomic, nullable) NSString *mediaCreditScheme;
@property (nonatomic, nullable) NSString *mediaCreditDescription;

@end

NS_ASSUME_NONNULL_END
