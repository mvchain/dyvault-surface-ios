//
//    TransactionRecordModel.h
//
//    Create by 蒲公英 on 7/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionRecordModel : NSObject

@property (nonatomic, assign) NSInteger classify;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, strong) NSString * fromAddress;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * orderRemark;
@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * toAddress;
@property (nonatomic, assign) NSInteger tokenId;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) NSInteger transactionType;
@property (nonatomic, assign) NSInteger updatedAt;
@property (nonatomic, assign) CGFloat value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
