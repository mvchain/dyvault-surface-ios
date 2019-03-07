//
//    TransactionHeadInfoModel.m
//
//    Create by 蒲公英 on 7/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TransactionHeadInfoModel.h"

NSString *const kTransactionHeadInfoModelBalance = @"balance";
NSString *const kTransactionHeadInfoModelFee = @"fee";
NSString *const kTransactionHeadInfoModelFeeTokenName = @"feeTokenName";

@interface TransactionHeadInfoModel ()
@end
@implementation TransactionHeadInfoModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTransactionHeadInfoModelBalance] isKindOfClass:[NSNull class]]){
        self.balance = [dictionary[kTransactionHeadInfoModelBalance] doubleValue];
    }
    
    if(![dictionary[kTransactionHeadInfoModelFee] isKindOfClass:[NSNull class]]){
        self.fee = [dictionary[kTransactionHeadInfoModelFee] doubleValue];
    }
    
    if(![dictionary[kTransactionHeadInfoModelFeeTokenName] isKindOfClass:[NSNull class]]){
        self.feeTokenName = dictionary[kTransactionHeadInfoModelFeeTokenName];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kTransactionHeadInfoModelBalance] = @(self.balance);
    dictionary[kTransactionHeadInfoModelFee] = @(self.fee);
    if(self.feeTokenName != nil){
        dictionary[kTransactionHeadInfoModelFeeTokenName] = self.feeTokenName;
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
    [aCoder encodeObject:@(self.balance) forKey:kTransactionHeadInfoModelBalance];    [aCoder encodeObject:@(self.fee) forKey:kTransactionHeadInfoModelFee];    if(self.feeTokenName != nil){
        [aCoder encodeObject:self.feeTokenName forKey:kTransactionHeadInfoModelFeeTokenName];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.balance = [[aDecoder decodeObjectForKey:kTransactionHeadInfoModelBalance] doubleValue];
    self.fee = [[aDecoder decodeObjectForKey:kTransactionHeadInfoModelFee] doubleValue];
    self.feeTokenName = [aDecoder decodeObjectForKey:kTransactionHeadInfoModelFeeTokenName];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TransactionHeadInfoModel *copy = [TransactionHeadInfoModel new];
    
    copy.balance = self.balance;
    copy.fee = self.fee;
    copy.feeTokenName = [self.feeTokenName copy];
    
    return copy;
}
@end
