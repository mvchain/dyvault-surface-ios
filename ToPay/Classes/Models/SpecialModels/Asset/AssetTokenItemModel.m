//
//	AssetTokenItemModel.m
//
//	Create by 蒲公英 on 1/3/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "AssetTokenItemModel.h"

NSString *const kAssetTokenItemModelRatio = @"ratio";
NSString *const kAssetTokenItemModelTokenId = @"tokenId";
NSString *const kAssetTokenItemModelTokenImage = @"tokenImage";
NSString *const kAssetTokenItemModelTokenName = @"tokenName";
NSString *const kAssetTokenItemModelValue = @"value";

@interface AssetTokenItemModel ()
@end
@implementation AssetTokenItemModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAssetTokenItemModelRatio] isKindOfClass:[NSNull class]]){
		self.ratio = [dictionary[kAssetTokenItemModelRatio] doubleValue];
	}

	if(![dictionary[kAssetTokenItemModelTokenId] isKindOfClass:[NSNull class]]){
		self.tokenId = [dictionary[kAssetTokenItemModelTokenId] integerValue];
	}

	if(![dictionary[kAssetTokenItemModelTokenImage] isKindOfClass:[NSNull class]]){
		self.tokenImage = dictionary[kAssetTokenItemModelTokenImage];
	}	
	if(![dictionary[kAssetTokenItemModelTokenName] isKindOfClass:[NSNull class]]){
		self.tokenName = dictionary[kAssetTokenItemModelTokenName];
	}	
	if(![dictionary[kAssetTokenItemModelValue] isKindOfClass:[NSNull class]]){
		self.value = [dictionary[kAssetTokenItemModelValue] doubleValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kAssetTokenItemModelRatio] = @(self.ratio);
	dictionary[kAssetTokenItemModelTokenId] = @(self.tokenId);
	if(self.tokenImage != nil){
		dictionary[kAssetTokenItemModelTokenImage] = self.tokenImage;
	}
	if(self.tokenName != nil){
		dictionary[kAssetTokenItemModelTokenName] = self.tokenName;
	}
	dictionary[kAssetTokenItemModelValue] = @(self.value);
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
	[aCoder encodeObject:@(self.ratio) forKey:kAssetTokenItemModelRatio];	[aCoder encodeObject:@(self.tokenId) forKey:kAssetTokenItemModelTokenId];	if(self.tokenImage != nil){
		[aCoder encodeObject:self.tokenImage forKey:kAssetTokenItemModelTokenImage];
	}
	if(self.tokenName != nil){
		[aCoder encodeObject:self.tokenName forKey:kAssetTokenItemModelTokenName];
	}
	[aCoder encodeObject:@(self.value) forKey:kAssetTokenItemModelValue];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ratio = [[aDecoder decodeObjectForKey:kAssetTokenItemModelRatio] doubleValue];
	self.tokenId = [[aDecoder decodeObjectForKey:kAssetTokenItemModelTokenId] integerValue];
	self.tokenImage = [aDecoder decodeObjectForKey:kAssetTokenItemModelTokenImage];
	self.tokenName = [aDecoder decodeObjectForKey:kAssetTokenItemModelTokenName];
	self.value = [[aDecoder decodeObjectForKey:kAssetTokenItemModelValue] doubleValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AssetTokenItemModel *copy = [AssetTokenItemModel new];

	copy.ratio = self.ratio;
	copy.tokenId = self.tokenId;
	copy.tokenImage = [self.tokenImage copy];
	copy.tokenName = [self.tokenName copy];
	copy.value = self.value;

	return copy;
}
@end
