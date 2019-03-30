//
//    OneKeyBuyTokenDetailModel.h
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneKeyBuyTokenDetailModel : NSObject

@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, assign) NSInteger buyUserId;
@property (nonatomic, strong) NSString * buyUsername;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger limitTime;
@property (nonatomic, strong) NSString * orderNumber;
@property (nonatomic, assign) NSInteger orderStatus;
@property (nonatomic, assign) NSInteger orderType;
@property (nonatomic, strong) NSString * payAccount;
@property (nonatomic, assign) NSInteger payAt;
@property (nonatomic, assign) NSInteger payType;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger sellUserId;
@property (nonatomic, strong) NSString * sellUsername;
@property (nonatomic, assign) NSInteger stopAt;
@property (nonatomic, strong) NSString * tokenId;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) CGFloat tokenValue;
@property (nonatomic, assign) NSInteger userId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
