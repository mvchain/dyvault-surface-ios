//
//	UserIDCardModel.m
//
//	Create by 蒲公英 on 28/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UserIDCardModel.h"

NSString *const kUserIDCardModelEmail = @"email";
NSString *const kUserIDCardModelRefreshToken = @"refreshToken";
NSString *const kUserIDCardModelToken = @"token";
NSString *const kUserIDCardModelUserId = @"userId";

@interface UserIDCardModel ()
@end
@implementation UserIDCardModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserIDCardModelEmail] isKindOfClass:[NSNull class]]){
		self.email = dictionary[kUserIDCardModelEmail];
	}	
	if(![dictionary[kUserIDCardModelRefreshToken] isKindOfClass:[NSNull class]]){
		self.refreshToken = dictionary[kUserIDCardModelRefreshToken];
	}	
	if(![dictionary[kUserIDCardModelToken] isKindOfClass:[NSNull class]]){
		self.token = dictionary[kUserIDCardModelToken];
	}	
	if(![dictionary[kUserIDCardModelUserId] isKindOfClass:[NSNull class]]){
		self.userId = [dictionary[kUserIDCardModelUserId] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.email != nil){
		dictionary[kUserIDCardModelEmail] = self.email;
	}
	if(self.refreshToken != nil){
		dictionary[kUserIDCardModelRefreshToken] = self.refreshToken;
	}
	if(self.token != nil){
		dictionary[kUserIDCardModelToken] = self.token;
	}
	dictionary[kUserIDCardModelUserId] = @(self.userId);
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
	if(self.email != nil){
		[aCoder encodeObject:self.email forKey:kUserIDCardModelEmail];
	}
	if(self.refreshToken != nil){
		[aCoder encodeObject:self.refreshToken forKey:kUserIDCardModelRefreshToken];
	}
	if(self.token != nil){
		[aCoder encodeObject:self.token forKey:kUserIDCardModelToken];
	}
	[aCoder encodeObject:@(self.userId) forKey:kUserIDCardModelUserId];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.email = [aDecoder decodeObjectForKey:kUserIDCardModelEmail];
	self.refreshToken = [aDecoder decodeObjectForKey:kUserIDCardModelRefreshToken];
	self.token = [aDecoder decodeObjectForKey:kUserIDCardModelToken];
	self.userId = [[aDecoder decodeObjectForKey:kUserIDCardModelUserId] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserIDCardModel *copy = [UserIDCardModel new];

	copy.email = [self.email copy];
	copy.refreshToken = [self.refreshToken copy];
	copy.token = [self.token copy];
	copy.userId = self.userId;

	return copy;
}
@end