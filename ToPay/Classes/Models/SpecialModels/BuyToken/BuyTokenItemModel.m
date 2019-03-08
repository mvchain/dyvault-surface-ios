//
//    BuyTokenItemModel.m
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BuyTokenItemModel.h"

NSString *const kBuyTokenItemModelChannelName = @"channelName";
NSString *const kBuyTokenItemModelContact = @"contact";
NSString *const kBuyTokenItemModelCreatedAt = @"createdAt";
NSString *const kBuyTokenItemModelIdField = @"id";
NSString *const kBuyTokenItemModelInfo = @"info";
NSString *const kBuyTokenItemModelUpdatedAt = @"updatedAt";

@interface BuyTokenItemModel ()
@end
@implementation BuyTokenItemModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kBuyTokenItemModelChannelName] isKindOfClass:[NSNull class]]){
        self.channelName = dictionary[kBuyTokenItemModelChannelName];
    }
    if(![dictionary[kBuyTokenItemModelContact] isKindOfClass:[NSNull class]]){
        self.contact = dictionary[kBuyTokenItemModelContact];
    }
    if(![dictionary[kBuyTokenItemModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kBuyTokenItemModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kBuyTokenItemModelIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kBuyTokenItemModelIdField] integerValue];
    }
    
    if(![dictionary[kBuyTokenItemModelInfo] isKindOfClass:[NSNull class]]){
        self.info = dictionary[kBuyTokenItemModelInfo];
    }
    if(![dictionary[kBuyTokenItemModelUpdatedAt] isKindOfClass:[NSNull class]]){
        self.updatedAt = [dictionary[kBuyTokenItemModelUpdatedAt] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.channelName != nil){
        dictionary[kBuyTokenItemModelChannelName] = self.channelName;
    }
    if(self.contact != nil){
        dictionary[kBuyTokenItemModelContact] = self.contact;
    }
    dictionary[kBuyTokenItemModelCreatedAt] = @(self.createdAt);
    dictionary[kBuyTokenItemModelIdField] = @(self.idField);
    if(self.info != nil){
        dictionary[kBuyTokenItemModelInfo] = self.info;
    }
    dictionary[kBuyTokenItemModelUpdatedAt] = @(self.updatedAt);
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
    if(self.channelName != nil){
        [aCoder encodeObject:self.channelName forKey:kBuyTokenItemModelChannelName];
    }
    if(self.contact != nil){
        [aCoder encodeObject:self.contact forKey:kBuyTokenItemModelContact];
    }
    [aCoder encodeObject:@(self.createdAt) forKey:kBuyTokenItemModelCreatedAt];    [aCoder encodeObject:@(self.idField) forKey:kBuyTokenItemModelIdField];    if(self.info != nil){
        [aCoder encodeObject:self.info forKey:kBuyTokenItemModelInfo];
    }
    [aCoder encodeObject:@(self.updatedAt) forKey:kBuyTokenItemModelUpdatedAt];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.channelName = [aDecoder decodeObjectForKey:kBuyTokenItemModelChannelName];
    self.contact = [aDecoder decodeObjectForKey:kBuyTokenItemModelContact];
    self.createdAt = [[aDecoder decodeObjectForKey:kBuyTokenItemModelCreatedAt] integerValue];
    self.idField = [[aDecoder decodeObjectForKey:kBuyTokenItemModelIdField] integerValue];
    self.info = [aDecoder decodeObjectForKey:kBuyTokenItemModelInfo];
    self.updatedAt = [[aDecoder decodeObjectForKey:kBuyTokenItemModelUpdatedAt] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    BuyTokenItemModel *copy = [BuyTokenItemModel new];
    
    copy.channelName = [self.channelName copy];
    copy.contact = [self.contact copy];
    copy.createdAt = self.createdAt;
    copy.idField = self.idField;
    copy.info = [self.info copy];
    copy.updatedAt = self.updatedAt;
    
    return copy;
}
@end
