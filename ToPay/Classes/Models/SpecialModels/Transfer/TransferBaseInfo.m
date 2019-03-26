//
//    TransferBaseInfo.m
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TransferBaseInfo.h"

NSString *const kTransferBaseInfoBalance = @"balance";
NSString *const kTransferBaseInfoFee = @"fee";
NSString *const kTransferBaseInfoFeeTokenName = @"feeTokenName";

@interface TransferBaseInfo ()
@end
@implementation TransferBaseInfo
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTransferBaseInfoBalance] isKindOfClass:[NSNull class]]){
        self.balance = [dictionary[kTransferBaseInfoBalance] doubleValue];
    }
    if(![dictionary[kTransferBaseInfoFee] isKindOfClass:[NSNull class]]){
        self.fee = [dictionary[kTransferBaseInfoFee] doubleValue];
    }
    if(![dictionary[kTransferBaseInfoFeeTokenName] isKindOfClass:[NSNull class]]){
        self.feeTokenName = dictionary[kTransferBaseInfoFeeTokenName];
    }
    return self;
}
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kTransferBaseInfoBalance] = @(self.balance);
    dictionary[kTransferBaseInfoFee] = @(self.fee);
    if(self.feeTokenName != nil){
        dictionary[kTransferBaseInfoFeeTokenName] = self.feeTokenName;
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
    [aCoder encodeObject:@(self.balance) forKey:kTransferBaseInfoBalance];    [aCoder encodeObject:@(self.fee) forKey:kTransferBaseInfoFee];    if(self.feeTokenName != nil){
        [aCoder encodeObject:self.feeTokenName forKey:kTransferBaseInfoFeeTokenName];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.balance = [[aDecoder decodeObjectForKey:kTransferBaseInfoBalance] doubleValue];
    self.fee = [[aDecoder decodeObjectForKey:kTransferBaseInfoFee] doubleValue];
    self.feeTokenName = [aDecoder decodeObjectForKey:kTransferBaseInfoFeeTokenName];
    return self;
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TransferBaseInfo *copy = [TransferBaseInfo new];
    copy.balance = self.balance;
    copy.fee = self.fee;
    copy.feeTokenName = [self.feeTokenName copy];
    return copy;
}
@end
