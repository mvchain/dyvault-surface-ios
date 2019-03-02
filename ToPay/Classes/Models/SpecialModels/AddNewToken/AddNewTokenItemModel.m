//
//	AddNewTokenItemModel.m
//
//	Create by 蒲公英 on 1/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AddNewTokenItemModel.h"

NSString *const kAddNewTokenItemModelTimestamp = @"timestamp";
NSString *const kAddNewTokenItemModelTokenCnName = @"tokenCnName";
NSString *const kAddNewTokenItemModelTokenEnName = @"tokenEnName";
NSString *const kAddNewTokenItemModelTokenId = @"tokenId";
NSString *const kAddNewTokenItemModelTokenImage = @"tokenImage";
NSString *const kAddNewTokenItemModelTokenName = @"tokenName";
NSString *const kAddNewTokenItemModelTokenType = @"tokenType";
NSString *const kAddNewTokenItemModelVisible = @"visible";

@interface AddNewTokenItemModel ()
@end
@implementation AddNewTokenItemModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddNewTokenItemModelTimestamp] isKindOfClass:[NSNull class]]){
		self.timestamp = [dictionary[kAddNewTokenItemModelTimestamp] integerValue];
	}

	if(![dictionary[kAddNewTokenItemModelTokenCnName] isKindOfClass:[NSNull class]]){
		self.tokenCnName = dictionary[kAddNewTokenItemModelTokenCnName];
	}	
	if(![dictionary[kAddNewTokenItemModelTokenEnName] isKindOfClass:[NSNull class]]){
		self.tokenEnName = dictionary[kAddNewTokenItemModelTokenEnName];
	}	
	if(![dictionary[kAddNewTokenItemModelTokenId] isKindOfClass:[NSNull class]]){
		self.tokenId = [dictionary[kAddNewTokenItemModelTokenId] integerValue];
	}

	if(![dictionary[kAddNewTokenItemModelTokenImage] isKindOfClass:[NSNull class]]){
		self.tokenImage = dictionary[kAddNewTokenItemModelTokenImage];
	}	
	if(![dictionary[kAddNewTokenItemModelTokenName] isKindOfClass:[NSNull class]]){
		self.tokenName = dictionary[kAddNewTokenItemModelTokenName];
	}	
	if(![dictionary[kAddNewTokenItemModelTokenType] isKindOfClass:[NSNull class]]){
		self.tokenType = [dictionary[kAddNewTokenItemModelTokenType] integerValue];
	}

	if(![dictionary[kAddNewTokenItemModelVisible] isKindOfClass:[NSNull class]]){
		self.visible = [dictionary[kAddNewTokenItemModelVisible] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kAddNewTokenItemModelTimestamp] = @(self.timestamp);
	if(self.tokenCnName != nil){
		dictionary[kAddNewTokenItemModelTokenCnName] = self.tokenCnName;
	}
	if(self.tokenEnName != nil){
		dictionary[kAddNewTokenItemModelTokenEnName] = self.tokenEnName;
	}
	dictionary[kAddNewTokenItemModelTokenId] = @(self.tokenId);
	if(self.tokenImage != nil){
		dictionary[kAddNewTokenItemModelTokenImage] = self.tokenImage;
	}
	if(self.tokenName != nil){
		dictionary[kAddNewTokenItemModelTokenName] = self.tokenName;
	}
	dictionary[kAddNewTokenItemModelTokenType] = @(self.tokenType);
	dictionary[kAddNewTokenItemModelVisible] = @(self.visible);
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
	[aCoder encodeObject:@(self.timestamp) forKey:kAddNewTokenItemModelTimestamp];	if(self.tokenCnName != nil){
		[aCoder encodeObject:self.tokenCnName forKey:kAddNewTokenItemModelTokenCnName];
	}
	if(self.tokenEnName != nil){
		[aCoder encodeObject:self.tokenEnName forKey:kAddNewTokenItemModelTokenEnName];
	}
	[aCoder encodeObject:@(self.tokenId) forKey:kAddNewTokenItemModelTokenId];	if(self.tokenImage != nil){
		[aCoder encodeObject:self.tokenImage forKey:kAddNewTokenItemModelTokenImage];
	}
	if(self.tokenName != nil){
		[aCoder encodeObject:self.tokenName forKey:kAddNewTokenItemModelTokenName];
	}
	[aCoder encodeObject:@(self.tokenType) forKey:kAddNewTokenItemModelTokenType];	[aCoder encodeObject:@(self.visible) forKey:kAddNewTokenItemModelVisible];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.timestamp = [[aDecoder decodeObjectForKey:kAddNewTokenItemModelTimestamp] integerValue];
	self.tokenCnName = [aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenCnName];
	self.tokenEnName = [aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenEnName];
	self.tokenId = [[aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenId] integerValue];
	self.tokenImage = [aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenImage];
	self.tokenName = [aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenName];
	self.tokenType = [[aDecoder decodeObjectForKey:kAddNewTokenItemModelTokenType] integerValue];
	self.visible = [[aDecoder decodeObjectForKey:kAddNewTokenItemModelVisible] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddNewTokenItemModel *copy = [AddNewTokenItemModel new];

	copy.timestamp = self.timestamp;
	copy.tokenCnName = [self.tokenCnName copy];
	copy.tokenEnName = [self.tokenEnName copy];
	copy.tokenId = self.tokenId;
	copy.tokenImage = [self.tokenImage copy];
	copy.tokenName = [self.tokenName copy];
	copy.tokenType = self.tokenType;
	copy.visible = self.visible;

	return copy;
}
@end
