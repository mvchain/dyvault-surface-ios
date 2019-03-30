//
//    Order.m
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Order.h"

NSString *const kOrderAmount = @"amount";
NSString *const kOrderBuyUsername = @"buyUsername";
NSString *const kOrderLimitTime = @"limitTime";
NSString *const kOrderOrderNumber = @"orderNumber";
NSString *const kOrderPayAccount = @"payAccount";
NSString *const kOrderPayType = @"payType";
NSString *const kOrderPrice = @"price";
NSString *const kOrderRemitShopId = @"remitShopId";
NSString *const kOrderRemitUserId = @"remitUserId";
NSString *const kOrderSellUsername = @"sellUsername";
NSString *const kOrderShopId = @"shopId";
NSString *const kOrderSign = @"sign";
NSString *const kOrderTokenId = @"tokenId";
NSString *const kOrderTokenName = @"tokenName";
NSString *const kOrderTokenValue = @"tokenValue";

@interface Order ()
@end
@implementation Order




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderAmount] isKindOfClass:[NSNull class]]){
        self.amount = [dictionary[kOrderAmount] floatValue];
    }
    
    if(![dictionary[kOrderBuyUsername] isKindOfClass:[NSNull class]]){
        self.buyUsername = dictionary[kOrderBuyUsername];
    }
    if(![dictionary[kOrderLimitTime] isKindOfClass:[NSNull class]]){
        self.limitTime = [dictionary[kOrderLimitTime] integerValue];
    }
    
    if(![dictionary[kOrderOrderNumber] isKindOfClass:[NSNull class]]){
        self.orderNumber = dictionary[kOrderOrderNumber];
    }
    if(![dictionary[kOrderPayAccount] isKindOfClass:[NSNull class]]){
        self.payAccount = dictionary[kOrderPayAccount];
    }
    if(![dictionary[kOrderPayType] isKindOfClass:[NSNull class]]){
        self.payType = [dictionary[kOrderPayType] integerValue];
    }
    
    if(![dictionary[kOrderPrice] isKindOfClass:[NSNull class]]){
        self.price = [dictionary[kOrderPrice] floatValue];
    }
    
    if(![dictionary[kOrderRemitShopId] isKindOfClass:[NSNull class]]){
        self.remitShopId = [dictionary[kOrderRemitShopId] integerValue];
    }
    
    if(![dictionary[kOrderRemitUserId] isKindOfClass:[NSNull class]]){
        self.remitUserId = [dictionary[kOrderRemitUserId] integerValue];
    }
    
    if(![dictionary[kOrderSellUsername] isKindOfClass:[NSNull class]]){
        self.sellUsername = dictionary[kOrderSellUsername];
    }
    if(![dictionary[kOrderShopId] isKindOfClass:[NSNull class]]){
        self.shopId = [dictionary[kOrderShopId] integerValue];
    }
    
    if(![dictionary[kOrderSign] isKindOfClass:[NSNull class]]){
        self.sign = dictionary[kOrderSign];
    }
    if(![dictionary[kOrderTokenId] isKindOfClass:[NSNull class]]){
        self.tokenId = [dictionary[kOrderTokenId] integerValue];
    }
    
    if(![dictionary[kOrderTokenName] isKindOfClass:[NSNull class]]){
        self.tokenName = dictionary[kOrderTokenName];
    }
    if(![dictionary[kOrderTokenValue] isKindOfClass:[NSNull class]]){
        self.tokenValue = [dictionary[kOrderTokenValue] floatValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kOrderAmount] = @(self.amount);
    if(self.buyUsername != nil){
        dictionary[kOrderBuyUsername] = self.buyUsername;
    }
    dictionary[kOrderLimitTime] = @(self.limitTime);
    if(self.orderNumber != nil){
        dictionary[kOrderOrderNumber] = self.orderNumber;
    }
    if(self.payAccount != nil){
        dictionary[kOrderPayAccount] = self.payAccount;
    }
    dictionary[kOrderPayType] = @(self.payType);
    dictionary[kOrderPrice] = @(self.price);
    dictionary[kOrderRemitShopId] = @(self.remitShopId);
    dictionary[kOrderRemitUserId] = @(self.remitUserId);
    if(self.sellUsername != nil){
        dictionary[kOrderSellUsername] = self.sellUsername;
    }
    dictionary[kOrderShopId] = @(self.shopId);
    if(self.sign != nil){
        dictionary[kOrderSign] = self.sign;
    }
    dictionary[kOrderTokenId] = @(self.tokenId);
    if(self.tokenName != nil){
        dictionary[kOrderTokenName] = self.tokenName;
    }
    dictionary[kOrderTokenValue] = @(self.tokenValue);
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
    [aCoder encodeObject:@(self.amount) forKey:kOrderAmount];    if(self.buyUsername != nil){
        [aCoder encodeObject:self.buyUsername forKey:kOrderBuyUsername];
    }
    [aCoder encodeObject:@(self.limitTime) forKey:kOrderLimitTime];    if(self.orderNumber != nil){
        [aCoder encodeObject:self.orderNumber forKey:kOrderOrderNumber];
    }
    if(self.payAccount != nil){
        [aCoder encodeObject:self.payAccount forKey:kOrderPayAccount];
    }
    [aCoder encodeObject:@(self.payType) forKey:kOrderPayType];    [aCoder encodeObject:@(self.price) forKey:kOrderPrice];    [aCoder encodeObject:@(self.remitShopId) forKey:kOrderRemitShopId];    [aCoder encodeObject:@(self.remitUserId) forKey:kOrderRemitUserId];    if(self.sellUsername != nil){
        [aCoder encodeObject:self.sellUsername forKey:kOrderSellUsername];
    }
    [aCoder encodeObject:@(self.shopId) forKey:kOrderShopId];    if(self.sign != nil){
        [aCoder encodeObject:self.sign forKey:kOrderSign];
    }
    [aCoder encodeObject:@(self.tokenId) forKey:kOrderTokenId];    if(self.tokenName != nil){
        [aCoder encodeObject:self.tokenName forKey:kOrderTokenName];
    }
    [aCoder encodeObject:@(self.tokenValue) forKey:kOrderTokenValue];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.amount = [[aDecoder decodeObjectForKey:kOrderAmount] floatValue];
    self.buyUsername = [aDecoder decodeObjectForKey:kOrderBuyUsername];
    self.limitTime = [[aDecoder decodeObjectForKey:kOrderLimitTime] integerValue];
    self.orderNumber = [aDecoder decodeObjectForKey:kOrderOrderNumber];
    self.payAccount = [aDecoder decodeObjectForKey:kOrderPayAccount];
    self.payType = [[aDecoder decodeObjectForKey:kOrderPayType] integerValue];
    self.price = [[aDecoder decodeObjectForKey:kOrderPrice] floatValue];
    self.remitShopId = [[aDecoder decodeObjectForKey:kOrderRemitShopId] integerValue];
    self.remitUserId = [[aDecoder decodeObjectForKey:kOrderRemitUserId] integerValue];
    self.sellUsername = [aDecoder decodeObjectForKey:kOrderSellUsername];
    self.shopId = [[aDecoder decodeObjectForKey:kOrderShopId] integerValue];
    self.sign = [aDecoder decodeObjectForKey:kOrderSign];
    self.tokenId = [[aDecoder decodeObjectForKey:kOrderTokenId] integerValue];
    self.tokenName = [aDecoder decodeObjectForKey:kOrderTokenName];
    self.tokenValue = [[aDecoder decodeObjectForKey:kOrderTokenValue] floatValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    Order *copy = [Order new];
    
    copy.amount = self.amount;
    copy.buyUsername = [self.buyUsername copy];
    copy.limitTime = self.limitTime;
    copy.orderNumber = [self.orderNumber copy];
    copy.payAccount = [self.payAccount copy];
    copy.payType = self.payType;
    copy.price = self.price;
    copy.remitShopId = self.remitShopId;
    copy.remitUserId = self.remitUserId;
    copy.sellUsername = [self.sellUsername copy];
    copy.shopId = self.shopId;
    copy.sign = [self.sign copy];
    copy.tokenId = self.tokenId;
    copy.tokenName = [self.tokenName copy];
    copy.tokenValue = self.tokenValue;
    
    return copy;
}
@end
