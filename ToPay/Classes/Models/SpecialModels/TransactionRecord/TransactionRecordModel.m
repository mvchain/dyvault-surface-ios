//
//    TransactionRecordModel.m
//
//    Create by 蒲公英 on 7/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TransactionRecordModel.h"

NSString *const kTransactionRecordModelClassify = @"classify";
NSString *const kTransactionRecordModelCreatedAt = @"createdAt";
NSString *const kTransactionRecordModelFromAddress = @"fromAddress";
NSString *const kTransactionRecordModelIdField = @"id";
NSString *const kTransactionRecordModelOrderRemark = @"orderRemark";
NSString *const kTransactionRecordModelRatio = @"ratio";
NSString *const kTransactionRecordModelStatus = @"status";
NSString *const kTransactionRecordModelToAddress = @"toAddress";
NSString *const kTransactionRecordModelTokenId = @"tokenId";
NSString *const kTransactionRecordModelTokenName = @"tokenName";
NSString *const kTransactionRecordModelTransactionType = @"transactionType";
NSString *const kTransactionRecordModelUpdatedAt = @"updatedAt";
NSString *const kTransactionRecordModelValue = @"value";

@interface TransactionRecordModel ()
@end
@implementation TransactionRecordModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTransactionRecordModelClassify] isKindOfClass:[NSNull class]]){
        self.classify = [dictionary[kTransactionRecordModelClassify] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kTransactionRecordModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelFromAddress] isKindOfClass:[NSNull class]]){
        self.fromAddress = dictionary[kTransactionRecordModelFromAddress];
    }
    if(![dictionary[kTransactionRecordModelIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kTransactionRecordModelIdField] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelOrderRemark] isKindOfClass:[NSNull class]]){
        self.orderRemark = dictionary[kTransactionRecordModelOrderRemark];
    }
    if(![dictionary[kTransactionRecordModelRatio] isKindOfClass:[NSNull class]]){
        self.ratio = [dictionary[kTransactionRecordModelRatio] floatValue];
    }
    
    if(![dictionary[kTransactionRecordModelStatus] isKindOfClass:[NSNull class]]){
        self.status = [dictionary[kTransactionRecordModelStatus] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelToAddress] isKindOfClass:[NSNull class]]){
        self.toAddress = dictionary[kTransactionRecordModelToAddress];
    }
    if(![dictionary[kTransactionRecordModelTokenId] isKindOfClass:[NSNull class]]){
        self.tokenId = [dictionary[kTransactionRecordModelTokenId] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelTokenName] isKindOfClass:[NSNull class]]){
        self.tokenName = dictionary[kTransactionRecordModelTokenName];
    }
    if(![dictionary[kTransactionRecordModelTransactionType] isKindOfClass:[NSNull class]]){
        self.transactionType = [dictionary[kTransactionRecordModelTransactionType] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelUpdatedAt] isKindOfClass:[NSNull class]]){
        self.updatedAt = [dictionary[kTransactionRecordModelUpdatedAt] integerValue];
    }
    
    if(![dictionary[kTransactionRecordModelValue] isKindOfClass:[NSNull class]]){
        self.value = [dictionary[kTransactionRecordModelValue] floatValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kTransactionRecordModelClassify] = @(self.classify);
    dictionary[kTransactionRecordModelCreatedAt] = @(self.createdAt);
    if(self.fromAddress != nil){
        dictionary[kTransactionRecordModelFromAddress] = self.fromAddress;
    }
    dictionary[kTransactionRecordModelIdField] = @(self.idField);
    if(self.orderRemark != nil){
        dictionary[kTransactionRecordModelOrderRemark] = self.orderRemark;
    }
    dictionary[kTransactionRecordModelRatio] = @(self.ratio);
    dictionary[kTransactionRecordModelStatus] = @(self.status);
    if(self.toAddress != nil){
        dictionary[kTransactionRecordModelToAddress] = self.toAddress;
    }
    dictionary[kTransactionRecordModelTokenId] = @(self.tokenId);
    if(self.tokenName != nil){
        dictionary[kTransactionRecordModelTokenName] = self.tokenName;
    }
    dictionary[kTransactionRecordModelTransactionType] = @(self.transactionType);
    dictionary[kTransactionRecordModelUpdatedAt] = @(self.updatedAt);
    dictionary[kTransactionRecordModelValue] = @(self.value);
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
    [aCoder encodeObject:@(self.classify) forKey:kTransactionRecordModelClassify];    [aCoder encodeObject:@(self.createdAt) forKey:kTransactionRecordModelCreatedAt];    if(self.fromAddress != nil){
        [aCoder encodeObject:self.fromAddress forKey:kTransactionRecordModelFromAddress];
    }
    [aCoder encodeObject:@(self.idField) forKey:kTransactionRecordModelIdField];    if(self.orderRemark != nil){
        [aCoder encodeObject:self.orderRemark forKey:kTransactionRecordModelOrderRemark];
    }
    [aCoder encodeObject:@(self.ratio) forKey:kTransactionRecordModelRatio];    [aCoder encodeObject:@(self.status) forKey:kTransactionRecordModelStatus];    if(self.toAddress != nil){
        [aCoder encodeObject:self.toAddress forKey:kTransactionRecordModelToAddress];
    }
    [aCoder encodeObject:@(self.tokenId) forKey:kTransactionRecordModelTokenId];    if(self.tokenName != nil){
        [aCoder encodeObject:self.tokenName forKey:kTransactionRecordModelTokenName];
    }
    [aCoder encodeObject:@(self.transactionType) forKey:kTransactionRecordModelTransactionType];    [aCoder encodeObject:@(self.updatedAt) forKey:kTransactionRecordModelUpdatedAt];    [aCoder encodeObject:@(self.value) forKey:kTransactionRecordModelValue];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.classify = [[aDecoder decodeObjectForKey:kTransactionRecordModelClassify] integerValue];
    self.createdAt = [[aDecoder decodeObjectForKey:kTransactionRecordModelCreatedAt] integerValue];
    self.fromAddress = [aDecoder decodeObjectForKey:kTransactionRecordModelFromAddress];
    self.idField = [[aDecoder decodeObjectForKey:kTransactionRecordModelIdField] integerValue];
    self.orderRemark = [aDecoder decodeObjectForKey:kTransactionRecordModelOrderRemark];
    self.ratio = [[aDecoder decodeObjectForKey:kTransactionRecordModelRatio] floatValue];
    self.status = [[aDecoder decodeObjectForKey:kTransactionRecordModelStatus] integerValue];
    self.toAddress = [aDecoder decodeObjectForKey:kTransactionRecordModelToAddress];
    self.tokenId = [[aDecoder decodeObjectForKey:kTransactionRecordModelTokenId] integerValue];
    self.tokenName = [aDecoder decodeObjectForKey:kTransactionRecordModelTokenName];
    self.transactionType = [[aDecoder decodeObjectForKey:kTransactionRecordModelTransactionType] integerValue];
    self.updatedAt = [[aDecoder decodeObjectForKey:kTransactionRecordModelUpdatedAt] integerValue];
    self.value = [[aDecoder decodeObjectForKey:kTransactionRecordModelValue] floatValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TransactionRecordModel *copy = [TransactionRecordModel new];
    
    copy.classify = self.classify;
    copy.createdAt = self.createdAt;
    copy.fromAddress = [self.fromAddress copy];
    copy.idField = self.idField;
    copy.orderRemark = [self.orderRemark copy];
    copy.ratio = self.ratio;
    copy.status = self.status;
    copy.toAddress = [self.toAddress copy];
    copy.tokenId = self.tokenId;
    copy.tokenName = [self.tokenName copy];
    copy.transactionType = self.transactionType;
    copy.updatedAt = self.updatedAt;
    copy.value = self.value;
    
    return copy;
}
@end
