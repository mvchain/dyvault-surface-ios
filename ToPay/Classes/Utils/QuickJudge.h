//
//  QuickJudge.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuickJudge : NSObject
+ (BOOL)isVaildEmail:(NSString *)email;
+ (BOOL)is_iPhoneX;
+ (BOOL)isETH:(NSString *)ethString;
+ (BOOL)isBTC:(NSString *)btcString;

+ (BOOL)isVaildAddrWithTokenId:(NSString *)tokenId addr:(NSString *)addr;
@end

NS_ASSUME_NONNULL_END
