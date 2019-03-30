//
//    AdminInfo.m
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AdminInfo.h"

NSString *const kAdminInfoOrder = @"order";
NSString *const kAdminInfoRefreshToken = @"refreshToken";
NSString *const kAdminInfoToken = @"token";

@interface AdminInfo ()
@end
@implementation AdminInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kAdminInfoOrder] isKindOfClass:[NSNull class]]){
        self.order = [[Order alloc] initWithDictionary:dictionary[kAdminInfoOrder]];
    }
    
    if(![dictionary[kAdminInfoRefreshToken] isKindOfClass:[NSNull class]]){
        self.refreshToken = dictionary[kAdminInfoRefreshToken];
    }
    if(![dictionary[kAdminInfoToken] isKindOfClass:[NSNull class]]){
        self.token = dictionary[kAdminInfoToken];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.order != nil){
        dictionary[kAdminInfoOrder] = [self.order toDictionary];
    }
    if(self.refreshToken != nil){
        dictionary[kAdminInfoRefreshToken] = self.refreshToken;
    }
    if(self.token != nil){
        dictionary[kAdminInfoToken] = self.token;
    }
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
    if(self.order != nil){
        [aCoder encodeObject:self.order forKey:kAdminInfoOrder];
    }
    if(self.refreshToken != nil){
        [aCoder encodeObject:self.refreshToken forKey:kAdminInfoRefreshToken];
    }
    if(self.token != nil){
        [aCoder encodeObject:self.token forKey:kAdminInfoToken];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.order = [aDecoder decodeObjectForKey:kAdminInfoOrder];
    self.refreshToken = [aDecoder decodeObjectForKey:kAdminInfoRefreshToken];
    self.token = [aDecoder decodeObjectForKey:kAdminInfoToken];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    AdminInfo *copy = [AdminInfo new];
    
    copy.order = [self.order copy];
    copy.refreshToken = [self.refreshToken copy];
    copy.token = [self.token copy];
    
    return copy;
}
@end
