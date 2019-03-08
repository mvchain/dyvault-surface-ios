//
//    TransactionDetailModel.m
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TransactionDetailModel.h"

NSString *const kTransactionDetailModelBlockHash = @"blockHash";
NSString *const kTransactionDetailModelClassify = @"classify";
NSString *const kTransactionDetailModelCreatedAt = @"createdAt";
NSString *const kTransactionDetailModelFee = @"fee";
NSString *const kTransactionDetailModelFeeTokenType = @"feeTokenType";
NSString *const kTransactionDetailModelFromAddress = @"fromAddress";
NSString *const kTransactionDetailModelHashLink = @"hashLink";
NSString *const kTransactionDetailModelHeight = @"height";
NSString *const kTransactionDetailModelOrderNumber = @"orderNumber";
NSString *const kTransactionDetailModelOrderRemark = @"orderRemark";
NSString *const kTransactionDetailModelStatus = @"status";
NSString *const kTransactionDetailModelToAddress = @"toAddress";
NSString *const kTransactionDetailModelTokenName = @"tokenName";
NSString *const kTransactionDetailModelTransactionType = @"transactionType";
NSString *const kTransactionDetailModelUpdatedAt = @"updatedAt";
NSString *const kTransactionDetailModelValue = @"value";

@interface TransactionDetailModel ()
@end
@implementation TransactionDetailModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTransactionDetailModelBlockHash] isKindOfClass:[NSNull class]]){
        self.blockHash = dictionary[kTransactionDetailModelBlockHash];
    }
    if(![dictionary[kTransactionDetailModelClassify] isKindOfClass:[NSNull class]]){
        self.classify = [dictionary[kTransactionDetailModelClassify] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelCreatedAt] isKindOfClass:[NSNull class]]){
        self.createdAt = [dictionary[kTransactionDetailModelCreatedAt] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelFee] isKindOfClass:[NSNull class]]){
        self.fee = [dictionary[kTransactionDetailModelFee] floatValue];
    }
    
    if(![dictionary[kTransactionDetailModelFeeTokenType] isKindOfClass:[NSNull class]]){
        self.feeTokenType = dictionary[kTransactionDetailModelFeeTokenType];
    }
    if(![dictionary[kTransactionDetailModelFromAddress] isKindOfClass:[NSNull class]]){
        self.fromAddress = dictionary[kTransactionDetailModelFromAddress];
    }
    if(![dictionary[kTransactionDetailModelHashLink] isKindOfClass:[NSNull class]]){
        self.hashLink = dictionary[kTransactionDetailModelHashLink];
    }
    if(![dictionary[kTransactionDetailModelHeight] isKindOfClass:[NSNull class]]){
        self.height = [dictionary[kTransactionDetailModelHeight] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelOrderNumber] isKindOfClass:[NSNull class]]){
        self.orderNumber = dictionary[kTransactionDetailModelOrderNumber];
    }
    if(![dictionary[kTransactionDetailModelOrderRemark] isKindOfClass:[NSNull class]]){
        self.orderRemark = dictionary[kTransactionDetailModelOrderRemark];
    }
    if(![dictionary[kTransactionDetailModelStatus] isKindOfClass:[NSNull class]]){
        self.status = [dictionary[kTransactionDetailModelStatus] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelToAddress] isKindOfClass:[NSNull class]]){
        self.toAddress = dictionary[kTransactionDetailModelToAddress];
    }
    if(![dictionary[kTransactionDetailModelTokenName] isKindOfClass:[NSNull class]]){
        self.tokenName = dictionary[kTransactionDetailModelTokenName];
    }
    if(![dictionary[kTransactionDetailModelTransactionType] isKindOfClass:[NSNull class]]){
        self.transactionType = [dictionary[kTransactionDetailModelTransactionType] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelUpdatedAt] isKindOfClass:[NSNull class]]){
        self.updatedAt = [dictionary[kTransactionDetailModelUpdatedAt] integerValue];
    }
    
    if(![dictionary[kTransactionDetailModelValue] isKindOfClass:[NSNull class]]){
        self.value = [dictionary[kTransactionDetailModelValue] floatValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.blockHash != nil){
        dictionary[kTransactionDetailModelBlockHash] = self.blockHash;
    }
    dictionary[kTransactionDetailModelClassify] = @(self.classify);
    dictionary[kTransactionDetailModelCreatedAt] = @(self.createdAt);
    dictionary[kTransactionDetailModelFee] = @(self.fee);
    if(self.feeTokenType != nil){
        dictionary[kTransactionDetailModelFeeTokenType] = self.feeTokenType;
    }
    if(self.fromAddress != nil){
        dictionary[kTransactionDetailModelFromAddress] = self.fromAddress;
    }
    if(self.hashLink != nil){
        dictionary[kTransactionDetailModelHashLink] = self.hashLink;
    }
    dictionary[kTransactionDetailModelHeight] = @(self.height);
    if(self.orderNumber != nil){
        dictionary[kTransactionDetailModelOrderNumber] = self.orderNumber;
    }
    if(self.orderRemark != nil){
        dictionary[kTransactionDetailModelOrderRemark] = self.orderRemark;
    }
    dictionary[kTransactionDetailModelStatus] = @(self.status);
    if(self.toAddress != nil){
        dictionary[kTransactionDetailModelToAddress] = self.toAddress;
    }
    if(self.tokenName != nil){
        dictionary[kTransactionDetailModelTokenName] = self.tokenName;
    }
    dictionary[kTransactionDetailModelTransactionType] = @(self.transactionType);
    dictionary[kTransactionDetailModelUpdatedAt] = @(self.updatedAt);
    dictionary[kTransactionDetailModelValue] = @(self.value);
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
    if(self.blockHash != nil){
        [aCoder encodeObject:self.blockHash forKey:kTransactionDetailModelBlockHash];
    }
    [aCoder encodeObject:@(self.classify) forKey:kTransactionDetailModelClassify];    [aCoder encodeObject:@(self.createdAt) forKey:kTransactionDetailModelCreatedAt];    [aCoder encodeObject:@(self.fee) forKey:kTransactionDetailModelFee];    if(self.feeTokenType != nil){
        [aCoder encodeObject:self.feeTokenType forKey:kTransactionDetailModelFeeTokenType];
    }
    if(self.fromAddress != nil){
        [aCoder encodeObject:self.fromAddress forKey:kTransactionDetailModelFromAddress];
    }
    if(self.hashLink != nil){
        [aCoder encodeObject:self.hashLink forKey:kTransactionDetailModelHashLink];
    }
    [aCoder encodeObject:@(self.height) forKey:kTransactionDetailModelHeight];    if(self.orderNumber != nil){
        [aCoder encodeObject:self.orderNumber forKey:kTransactionDetailModelOrderNumber];
    }
    if(self.orderRemark != nil){
        [aCoder encodeObject:self.orderRemark forKey:kTransactionDetailModelOrderRemark];
    }
    [aCoder encodeObject:@(self.status) forKey:kTransactionDetailModelStatus];    if(self.toAddress != nil){
        [aCoder encodeObject:self.toAddress forKey:kTransactionDetailModelToAddress];
    }
    if(self.tokenName != nil){
        [aCoder encodeObject:self.tokenName forKey:kTransactionDetailModelTokenName];
    }
    [aCoder encodeObject:@(self.transactionType) forKey:kTransactionDetailModelTransactionType];    [aCoder encodeObject:@(self.updatedAt) forKey:kTransactionDetailModelUpdatedAt];    [aCoder encodeObject:@(self.value) forKey:kTransactionDetailModelValue];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.blockHash = [aDecoder decodeObjectForKey:kTransactionDetailModelBlockHash];
    self.classify = [[aDecoder decodeObjectForKey:kTransactionDetailModelClassify] integerValue];
    self.createdAt = [[aDecoder decodeObjectForKey:kTransactionDetailModelCreatedAt] integerValue];
    self.fee = [[aDecoder decodeObjectForKey:kTransactionDetailModelFee] floatValue];
    self.feeTokenType = [aDecoder decodeObjectForKey:kTransactionDetailModelFeeTokenType];
    self.fromAddress = [aDecoder decodeObjectForKey:kTransactionDetailModelFromAddress];
    self.hashLink = [aDecoder decodeObjectForKey:kTransactionDetailModelHashLink];
    self.height = [[aDecoder decodeObjectForKey:kTransactionDetailModelHeight] integerValue];
    self.orderNumber = [aDecoder decodeObjectForKey:kTransactionDetailModelOrderNumber];
    self.orderRemark = [aDecoder decodeObjectForKey:kTransactionDetailModelOrderRemark];
    self.status = [[aDecoder decodeObjectForKey:kTransactionDetailModelStatus] integerValue];
    self.toAddress = [aDecoder decodeObjectForKey:kTransactionDetailModelToAddress];
    self.tokenName = [aDecoder decodeObjectForKey:kTransactionDetailModelTokenName];
    self.transactionType = [[aDecoder decodeObjectForKey:kTransactionDetailModelTransactionType] integerValue];
    self.updatedAt = [[aDecoder decodeObjectForKey:kTransactionDetailModelUpdatedAt] integerValue];
    self.value = [[aDecoder decodeObjectForKey:kTransactionDetailModelValue] floatValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TransactionDetailModel *copy = [TransactionDetailModel new];
    
    copy.blockHash = [self.blockHash copy];
    copy.classify = self.classify;
    copy.createdAt = self.createdAt;
    copy.fee = self.fee;
    copy.feeTokenType = [self.feeTokenType copy];
    copy.fromAddress = [self.fromAddress copy];
    copy.hashLink = [self.hashLink copy];
    copy.height = self.height;
    copy.orderNumber = [self.orderNumber copy];
    copy.orderRemark = [self.orderRemark copy];
    copy.status = self.status;
    copy.toAddress = [self.toAddress copy];
    copy.tokenName = [self.tokenName copy];
    copy.transactionType = self.transactionType;
    copy.updatedAt = self.updatedAt;
    copy.value = self.value;
    
    return copy;
}
@end
