//
//    TransactionDetailModel.h
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionDetailModel : NSObject

@property (nonatomic, strong) NSString * blockHash;
@property (nonatomic, assign) NSInteger classify;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) CGFloat fee;
@property (nonatomic, strong) NSString * feeTokenType;
@property (nonatomic, strong) NSString * fromAddress;
@property (nonatomic, strong) NSString * hashLink;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * orderNumber;
@property (nonatomic, strong) NSString * orderRemark;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * toAddress;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) NSInteger transactionType;
@property (nonatomic, assign) NSInteger updatedAt;
@property (nonatomic, assign) CGFloat value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
