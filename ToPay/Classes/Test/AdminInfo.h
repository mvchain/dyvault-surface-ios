//
//    AdminInfo.h
//
//    Create by 蒲公英 on 30/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface AdminInfo : NSObject

@property (nonatomic, strong) Order * order;
@property (nonatomic, strong) NSString * refreshToken;
@property (nonatomic, strong) NSString * token;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
