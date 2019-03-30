//
//    OneKeyBuyTokenDetailModel.m
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OneKeyBuyTokenDetailModel.h"

NSString *const kOneKeyBuyTokenDetailModelAmount = @"amount";
NSString *const kOneKeyBuyTokenDetailModelBuyUserId = @"buyUserId";
NSString *const kOneKeyBuyTokenDetailModelBuyUsername = @"buyUsername";
NSString *const kOneKeyBuyTokenDetailModelCreatedAt = @"createdAt";
NSString *const kOneKeyBuyTokenDetailModelIdField = @"id";
NSString *const kOneKeyBuyTokenDetailModelLimitTime = @"limitTime";
NSString *const kOneKeyBuyTokenDetailModelOrderNumber = @"orderNumber";
NSString *const kOneKeyBuyTokenDetailModelOrderStatus = @"orderStatus";
NSString *const kOneKeyBuyTokenDetailModelOrderType = @"orderType";
NSString *const kOneKeyBuyTokenDetailModelPayAccount = @"payAccount";
NSString *const kOneKeyBuyTokenDetailModelPayAt = @"payAt";
NSString *const kOneKeyBuyTokenDetailModelPayType = @"payType";
NSString *const kOneKeyBuyTokenDetailModelPrice = @"price";
NSString *const kOneKeyBuyTokenDetailModelSellUserId = @"sellUserId";
NSString *const kOneKeyBuyTokenDetailModelSellUsername = @"sellUsername";
NSString *const kOneKeyBuyTokenDetailModelStopAt = @"stopAt";
NSString *const kOneKeyBuyTokenDetailModelTokenId = @"tokenId";
NSString *const kOneKeyBuyTokenDetailModelTokenName = @"tokenName";
NSString *const kOneKeyBuyTokenDetailModelTokenValue = @"tokenValue";
NSString *const kOneKeyBuyTokenDetailModelUserId = @"userId";

@interface OneKeyBuyTokenDetailModel ()
@end
@implementation OneKeyBuyTokenDetailModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOneKeyBuyTokenDetailModelAmount] isKindOfClass:[NSNull class]]){
        self.amount = [dictionary[kOneKeyBuyTokenDetailModelAmount] doubleValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelBuyUserId] isKindOfClass:[NSNull class]]){
        self.buyUserId = [dictionary[kOneKeyBuyTokenDetailModelBuyUserId] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelBuyUsername] isKindOfClass:[NSNull class]]){
        self.buyUsername = dictionary[kOneKeyBuyTokenDetailModelBuyUsername];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kOneKeyBuyTokenDetailModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kOneKeyBuyTokenDetailModelIdField] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelLimitTime] isKindOfClass:[NSNull class]]){
        self.limitTime = [dictionary[kOneKeyBuyTokenDetailModelLimitTime] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelOrderNumber] isKindOfClass:[NSNull class]]){
        self.orderNumber = dictionary[kOneKeyBuyTokenDetailModelOrderNumber];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelOrderStatus] isKindOfClass:[NSNull class]]){
        self.orderStatus = [dictionary[kOneKeyBuyTokenDetailModelOrderStatus] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelOrderType] isKindOfClass:[NSNull class]]){
        self.orderType = [dictionary[kOneKeyBuyTokenDetailModelOrderType] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelPayAccount] isKindOfClass:[NSNull class]]){
        self.payAccount = dictionary[kOneKeyBuyTokenDetailModelPayAccount];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelPayAt] isKindOfClass:[NSNull class]]){
        self.payAt = [dictionary[kOneKeyBuyTokenDetailModelPayAt] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelPayType] isKindOfClass:[NSNull class]]){
        self.payType = [dictionary[kOneKeyBuyTokenDetailModelPayType] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelPrice] isKindOfClass:[NSNull class]]){
        self.price = [dictionary[kOneKeyBuyTokenDetailModelPrice] doubleValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelSellUserId] isKindOfClass:[NSNull class]]){
        self.sellUserId = [dictionary[kOneKeyBuyTokenDetailModelSellUserId] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelSellUsername] isKindOfClass:[NSNull class]]){
        self.sellUsername = dictionary[kOneKeyBuyTokenDetailModelSellUsername];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelStopAt] isKindOfClass:[NSNull class]]){
        self.stopAt = [dictionary[kOneKeyBuyTokenDetailModelStopAt] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelTokenId] isKindOfClass:[NSNull class]]){
        self.tokenId = dictionary[kOneKeyBuyTokenDetailModelTokenId];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelTokenName] isKindOfClass:[NSNull class]]){
        self.tokenName = dictionary[kOneKeyBuyTokenDetailModelTokenName];
    }
    if(![dictionary[kOneKeyBuyTokenDetailModelTokenValue] isKindOfClass:[NSNull class]]){
        self.tokenValue = [dictionary[kOneKeyBuyTokenDetailModelTokenValue] doubleValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenDetailModelUserId] isKindOfClass:[NSNull class]]){
        self.userId = [dictionary[kOneKeyBuyTokenDetailModelUserId] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kOneKeyBuyTokenDetailModelAmount] = @(self.amount);
    dictionary[kOneKeyBuyTokenDetailModelBuyUserId] = @(self.buyUserId);
    if(self.buyUsername != nil){
        dictionary[kOneKeyBuyTokenDetailModelBuyUsername] = self.buyUsername;
    }
    dictionary[kOneKeyBuyTokenDetailModelCreatedAt] = @(self.createdAt);
    dictionary[kOneKeyBuyTokenDetailModelIdField] = @(self.idField);
    dictionary[kOneKeyBuyTokenDetailModelLimitTime] = @(self.limitTime);
    if(self.orderNumber != nil){
        dictionary[kOneKeyBuyTokenDetailModelOrderNumber] = self.orderNumber;
    }
    dictionary[kOneKeyBuyTokenDetailModelOrderStatus] = @(self.orderStatus);
    dictionary[kOneKeyBuyTokenDetailModelOrderType] = @(self.orderType);
    if(self.payAccount != nil){
        dictionary[kOneKeyBuyTokenDetailModelPayAccount] = self.payAccount;
    }
    dictionary[kOneKeyBuyTokenDetailModelPayAt] = @(self.payAt);
    dictionary[kOneKeyBuyTokenDetailModelPayType] = @(self.payType);
    dictionary[kOneKeyBuyTokenDetailModelPrice] = @(self.price);
    dictionary[kOneKeyBuyTokenDetailModelSellUserId] = @(self.sellUserId);
    if(self.sellUsername != nil){
        dictionary[kOneKeyBuyTokenDetailModelSellUsername] = self.sellUsername;
    }
    dictionary[kOneKeyBuyTokenDetailModelStopAt] = @(self.stopAt);
    if(self.tokenId != nil){
        dictionary[kOneKeyBuyTokenDetailModelTokenId] = self.tokenId;
    }
    if(self.tokenName != nil){
        dictionary[kOneKeyBuyTokenDetailModelTokenName] = self.tokenName;
    }
    dictionary[kOneKeyBuyTokenDetailModelTokenValue] = @(self.tokenValue);
    dictionary[kOneKeyBuyTokenDetailModelUserId] = @(self.userId);
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.amount) forKey:kOneKeyBuyTokenDetailModelAmount];    [aCoder encodeObject:@(self.buyUserId) forKey:kOneKeyBuyTokenDetailModelBuyUserId];    if(self.buyUsername != nil){
        [aCoder encodeObject:self.buyUsername forKey:kOneKeyBuyTokenDetailModelBuyUsername];
    }
    [aCoder encodeObject:@(self.createdAt) forKey:kOneKeyBuyTokenDetailModelCreatedAt];    [aCoder encodeObject:@(self.idField) forKey:kOneKeyBuyTokenDetailModelIdField];    [aCoder encodeObject:@(self.limitTime) forKey:kOneKeyBuyTokenDetailModelLimitTime];    if(self.orderNumber != nil){
        [aCoder encodeObject:self.orderNumber forKey:kOneKeyBuyTokenDetailModelOrderNumber];
    }
    [aCoder encodeObject:@(self.orderStatus) forKey:kOneKeyBuyTokenDetailModelOrderStatus];    [aCoder encodeObject:@(self.orderType) forKey:kOneKeyBuyTokenDetailModelOrderType];    if(self.payAccount != nil){
        [aCoder encodeObject:self.payAccount forKey:kOneKeyBuyTokenDetailModelPayAccount];
    }
    [aCoder encodeObject:@(self.payAt) forKey:kOneKeyBuyTokenDetailModelPayAt];    [aCoder encodeObject:@(self.payType) forKey:kOneKeyBuyTokenDetailModelPayType];    [aCoder encodeObject:@(self.price) forKey:kOneKeyBuyTokenDetailModelPrice];    [aCoder encodeObject:@(self.sellUserId) forKey:kOneKeyBuyTokenDetailModelSellUserId];    if(self.sellUsername != nil){
        [aCoder encodeObject:self.sellUsername forKey:kOneKeyBuyTokenDetailModelSellUsername];
    }
    [aCoder encodeObject:@(self.stopAt) forKey:kOneKeyBuyTokenDetailModelStopAt];    if(self.tokenId != nil){
        [aCoder encodeObject:self.tokenId forKey:kOneKeyBuyTokenDetailModelTokenId];
    }
    if(self.tokenName != nil){
        [aCoder encodeObject:self.tokenName forKey:kOneKeyBuyTokenDetailModelTokenName];
    }
    [aCoder encodeObject:@(self.tokenValue) forKey:kOneKeyBuyTokenDetailModelTokenValue];    [aCoder encodeObject:@(self.userId) forKey:kOneKeyBuyTokenDetailModelUserId];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.amount = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelAmount] doubleValue];
    self.buyUserId = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelBuyUserId] integerValue];
    self.buyUsername = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelBuyUsername];
    self.createdAt = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelCreatedAt] integerValue];
    self.idField = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelIdField] integerValue];
    self.limitTime = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelLimitTime] integerValue];
    self.orderNumber = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelOrderNumber];
    self.orderStatus = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelOrderStatus] integerValue];
    self.orderType = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelOrderType] integerValue];
    self.payAccount = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelPayAccount];
    self.payAt = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelPayAt] integerValue];
    self.payType = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelPayType] integerValue];
    self.price = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelPrice] doubleValue];
    self.sellUserId = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelSellUserId] integerValue];
    self.sellUsername = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelSellUsername];
    self.stopAt = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelStopAt] integerValue];
    self.tokenId = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelTokenId];
    self.tokenName = [aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelTokenName];
    self.tokenValue = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelTokenValue] doubleValue];
    self.userId = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenDetailModelUserId] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OneKeyBuyTokenDetailModel *copy = [OneKeyBuyTokenDetailModel new];
    
    copy.amount = self.amount;
    copy.buyUserId = self.buyUserId;
    copy.buyUsername = [self.buyUsername copy];
    copy.createdAt = self.createdAt;
    copy.idField = self.idField;
    copy.limitTime = self.limitTime;
    copy.orderNumber = [self.orderNumber copy];
    copy.orderStatus = self.orderStatus;
    copy.orderType = self.orderType;
    copy.payAccount = [self.payAccount copy];
    copy.payAt = self.payAt;
    copy.payType = self.payType;
    copy.price = self.price;
    copy.sellUserId = self.sellUserId;
    copy.sellUsername = [self.sellUsername copy];
    copy.stopAt = self.stopAt;
    copy.tokenId = [self.tokenId copy];
    copy.tokenName = [self.tokenName copy];
    copy.tokenValue = self.tokenValue;
    copy.userId = self.userId;
    
    return copy;
}
@end
