//
//    OneKeyBuyTokenListItem.m
//
//    Create by 蒲公英 on 25/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OneKeyBuyTokenListItem.h"

NSString *const kOneKeyBuyTokenListItemAmount = @"amount";
NSString *const kOneKeyBuyTokenListItemCreatedAt = @"createdAt";
NSString *const kOneKeyBuyTokenListItemIdField = @"id";
NSString *const kOneKeyBuyTokenListItemOrderNumber = @"orderNumber";
NSString *const kOneKeyBuyTokenListItemOrderStatus = @"orderStatus";
NSString *const kOneKeyBuyTokenListItemOrderType = @"orderType";
NSString *const kOneKeyBuyTokenListItemStopAt = @"stopAt";
NSString *const kOneKeyBuyTokenListItemTokenId = @"tokenId";
NSString *const kOneKeyBuyTokenListItemTokenName = @"tokenName";
NSString *const kOneKeyBuyTokenListItemTokenValue = @"tokenValue";
NSString *const kOneKeyBuyTokenListItemUserId = @"userId";

@interface OneKeyBuyTokenListItem ()
@end
@implementation OneKeyBuyTokenListItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOneKeyBuyTokenListItemAmount] isKindOfClass:[NSNull class]]){
        self.amount = [dictionary[kOneKeyBuyTokenListItemAmount] doubleValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kOneKeyBuyTokenListItemCreatedAt] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kOneKeyBuyTokenListItemIdField] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemOrderNumber] isKindOfClass:[NSNull class]]){
        self.orderNumber = dictionary[kOneKeyBuyTokenListItemOrderNumber];
    }
    if(![dictionary[kOneKeyBuyTokenListItemOrderStatus] isKindOfClass:[NSNull class]]){
        self.orderStatus = [dictionary[kOneKeyBuyTokenListItemOrderStatus] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemOrderType] isKindOfClass:[NSNull class]]){
        self.orderType = [dictionary[kOneKeyBuyTokenListItemOrderType] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemStopAt] isKindOfClass:[NSNull class]]){
        self.stopAt = [dictionary[kOneKeyBuyTokenListItemStopAt] integerValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemTokenId] isKindOfClass:[NSNull class]]){
        self.tokenId = dictionary[kOneKeyBuyTokenListItemTokenId];
    }
    if(![dictionary[kOneKeyBuyTokenListItemTokenName] isKindOfClass:[NSNull class]]){
        self.tokenName = dictionary[kOneKeyBuyTokenListItemTokenName];
    }
    if(![dictionary[kOneKeyBuyTokenListItemTokenValue] isKindOfClass:[NSNull class]]){
        self.tokenValue = [dictionary[kOneKeyBuyTokenListItemTokenValue] doubleValue];
    }
    
    if(![dictionary[kOneKeyBuyTokenListItemUserId] isKindOfClass:[NSNull class]]){
        self.userId = [dictionary[kOneKeyBuyTokenListItemUserId] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kOneKeyBuyTokenListItemAmount] = @(self.amount);
    dictionary[kOneKeyBuyTokenListItemCreatedAt] = @(self.createdAt);
    dictionary[kOneKeyBuyTokenListItemIdField] = @(self.idField);
    if(self.orderNumber != nil){
        dictionary[kOneKeyBuyTokenListItemOrderNumber] = self.orderNumber;
    }
    dictionary[kOneKeyBuyTokenListItemOrderStatus] = @(self.orderStatus);
    dictionary[kOneKeyBuyTokenListItemOrderType] = @(self.orderType);
    dictionary[kOneKeyBuyTokenListItemStopAt] = @(self.stopAt);
    if(self.tokenId != nil){
        dictionary[kOneKeyBuyTokenListItemTokenId] = self.tokenId;
    }
    if(self.tokenName != nil){
        dictionary[kOneKeyBuyTokenListItemTokenName] = self.tokenName;
    }
    dictionary[kOneKeyBuyTokenListItemTokenValue] = @(self.tokenValue);
    dictionary[kOneKeyBuyTokenListItemUserId] = @(self.userId);
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
    [aCoder encodeObject:@(self.amount) forKey:kOneKeyBuyTokenListItemAmount];    [aCoder encodeObject:@(self.createdAt) forKey:kOneKeyBuyTokenListItemCreatedAt];    [aCoder encodeObject:@(self.idField) forKey:kOneKeyBuyTokenListItemIdField];    if(self.orderNumber != nil){
        [aCoder encodeObject:self.orderNumber forKey:kOneKeyBuyTokenListItemOrderNumber];
    }
    [aCoder encodeObject:@(self.orderStatus) forKey:kOneKeyBuyTokenListItemOrderStatus];    [aCoder encodeObject:@(self.orderType) forKey:kOneKeyBuyTokenListItemOrderType];    [aCoder encodeObject:@(self.stopAt) forKey:kOneKeyBuyTokenListItemStopAt];    if(self.tokenId != nil){
        [aCoder encodeObject:self.tokenId forKey:kOneKeyBuyTokenListItemTokenId];
    }
    if(self.tokenName != nil){
        [aCoder encodeObject:self.tokenName forKey:kOneKeyBuyTokenListItemTokenName];
    }
    [aCoder encodeObject:@(self.tokenValue) forKey:kOneKeyBuyTokenListItemTokenValue];    [aCoder encodeObject:@(self.userId) forKey:kOneKeyBuyTokenListItemUserId];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.amount = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemAmount] doubleValue];
    self.createdAt = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemCreatedAt] integerValue];
    self.idField = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemIdField] integerValue];
    self.orderNumber = [aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemOrderNumber];
    self.orderStatus = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemOrderStatus] integerValue];
    self.orderType = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemOrderType] integerValue];
    self.stopAt = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemStopAt] integerValue];
    self.tokenId = [aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemTokenId];
    self.tokenName = [aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemTokenName];
    self.tokenValue = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemTokenValue] doubleValue];
    self.userId = [[aDecoder decodeObjectForKey:kOneKeyBuyTokenListItemUserId] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OneKeyBuyTokenListItem *copy = [OneKeyBuyTokenListItem new];
    
    copy.amount = self.amount;
    copy.createdAt = self.createdAt;
    copy.idField = self.idField;
    copy.orderNumber = [self.orderNumber copy];
    copy.orderStatus = self.orderStatus;
    copy.orderType = self.orderType;
    copy.stopAt = self.stopAt;
    copy.tokenId = [self.tokenId copy];
    copy.tokenName = [self.tokenName copy];
    copy.tokenValue = self.tokenValue;
    copy.userId = self.userId;
    
    return copy;
}
@end
