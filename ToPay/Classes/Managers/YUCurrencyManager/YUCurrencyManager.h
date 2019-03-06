//
//  YUCurrencyManager.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>
NSString * const TPCacheName = @"TPCacheName";
NSString * const TPUserInfoKey = @"TPUserInfoKey";
NSString * const TPCurrencyListKey = @"MHCurrencyListKey";
NSString * const TPCurrencyNameKey = @"TPCurrencyNameKey";
NSString * const TPLegalCurrencyListKey = @"TPLegalCurrencyListKey";
NSString * const TPNowLegalCurrencyKey = @"TPNowLegalCurrencyKey";
NSString * const TPNowLegalSymbolKey = @"TPNowLegalSymbolKey";
NSString * const TPNowLegalNameKey = @"TPNowLegalNameKey";
NS_ASSUME_NONNULL_BEGIN

@interface YUCurrencyManager : NSObject
+ (instancetype) shareInstance;
@end

NS_ASSUME_NONNULL_END
