//
//    Order.h
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Order : NSObject

@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, strong) NSString * buyUsername;
@property (nonatomic, assign) NSInteger limitTime;
@property (nonatomic, strong) NSString * orderNumber;
@property (nonatomic, strong) NSString * payAccount;
@property (nonatomic, assign) NSInteger payType;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger remitShopId;
@property (nonatomic, assign) NSInteger remitUserId;
@property (nonatomic, strong) NSString * sellUsername;
@property (nonatomic, assign) NSInteger shopId;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, assign) NSInteger tokenId;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) CGFloat tokenValue;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
