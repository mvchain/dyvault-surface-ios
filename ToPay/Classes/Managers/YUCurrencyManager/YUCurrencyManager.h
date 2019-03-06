//
//  YUCurrencyManager.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@class TPExchangeRate;
@interface YUCurrencyManager : NSObject
+ (instancetype) shareInstance;
- (void)updateRequestTokenBase:(void(^)(BOOL isSucc))complete;
- (void)updateExchangeRate:(void(^)(BOOL isSucc))complete;
- (NSArray <TPExchangeRate *>*)legalCurrencyListArrays;
- (void)setNowLegalCurrency:(TPExchangeRate *)ratioM;
- (NSString *)nowLegalCurrencyName;
- (CGFloat)nowLegalCurrencyRatio;
- (NSString *)nowLegalCurrencyFlag;
@end

NS_ASSUME_NONNULL_END
