//
//  YUCurrencyManager.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCurrencyManager.h"
#import "API_GET_Token_Base.h"
#import "API_GET_Token_Exchange_Rate.h"
#import "TPCurrencyRatio.h"

@implementation YUCurrencyManager
static YUCurrencyManager* _instance = nil;
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [YUCurrencyManager shareInstance] ;
}
- (id)copyWithZone:(struct _NSZone *)zone
{
    return [YUCurrencyManager shareInstance] ;
}
#pragma mark - <public method>

- (NSArray <TPExchangeRate *>*)legalCurrencyListArrays {
    YYCache *listCache = [YYCache cacheWithName:TPCacheName];
    NSArray <TPExchangeRate *>*listArr = (NSArray<TPExchangeRate *> *)[listCache objectForKey:TPLegalCurrencyListKey];
    return listArr;
}
- (void)setNowLegalCurrency:(TPExchangeRate *)ratioM {
    [USER_DEFAULT setObject:ratioM.value forKey:TPNowLegalCurrencyKey];
    [USER_DEFAULT setObject:[ratioM.name substringToIndex:1] forKey:TPNowLegalSymbolKey];
    [USER_DEFAULT setObject:[ratioM.name substringFromIndex:1] forKey:TPNowLegalNameKey];
    [TPNotificationCenter postNotificationName:TPLegalSwitchNotification object:nil];
}
- (NSString *)nowLegalCurrencyName {
    return [USER_DEFAULT objectForKey:TPNowLegalNameKey];
    
}
- (CGFloat)nowLegalCurrencyRatio {
    return [[USER_DEFAULT objectForKey:TPNowLegalCurrencyKey] doubleValue];
}
- (NSString *)nowLegalCurrencyFlag {
     return [USER_DEFAULT objectForKey:TPNowLegalSymbolKey];
}
/* dont use */
- (void)updateRequestTokenBase:(void(^)(BOOL isSucc))complete {
    API_GET_Token_Base *GET_Token_Base = [[API_GET_Token_Base alloc] init];
    GET_Token_Base.onSuccess = ^(id responseData) {
        NSDictionary *data = (NSDictionary *)responseData;
        NSArray<TPCurrencyRatio *> *currencyRatios = [TPCurrencyRatio mj_objectArrayWithKeyValuesArray:data];
        YYCache *listCache = [YYCache cacheWithName:TPCacheName];
        [listCache setObject:currencyRatios forKey:TPCurrencyRatioKey];
        complete(YES);
    };
    GET_Token_Base.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_Token_Base.onEndConnection = ^{
        
    };
    [GET_Token_Base sendRequest];
}

/* law currency  */
- (void)updateExchangeRate:(void(^)(BOOL isSucc))complete {
    API_GET_Token_Exchange_Rate *GET_Token_Exchange_Rate = [[API_GET_Token_Exchange_Rate alloc] init];
    GET_Token_Exchange_Rate.onSuccess = ^(id responseData) {
        NSDictionary *data = (NSDictionary *)responseData;
        NSArray<TPExchangeRate *> *exchanges = [TPExchangeRate mj_objectArrayWithKeyValuesArray:data];
        YYCache *listCache = [YYCache cacheWithName:TPCacheName];
        [listCache setObject:exchanges forKey:TPLegalCurrencyListKey];
        for (int i = 0 ; i <exchanges.count ; i++)
        {
            TPExchangeRate *exRate = exchanges[i];
            [listCache setObject:exRate.value forKey:exRate.name];
        }
        TPExchangeRate *firstRatioM = exchanges[0];
        [USER_DEFAULT setObject:firstRatioM.value forKey:TPNowLegalCurrencyKey];
        [USER_DEFAULT setObject:[firstRatioM.name substringToIndex:1] forKey:TPNowLegalSymbolKey];
        [USER_DEFAULT setObject:[firstRatioM.name substringFromIndex:1] forKey:TPNowLegalNameKey];
        [TPNotificationCenter postNotificationName:TPLegalSwitchNotification object:nil];
        complete(YES);
    };
    GET_Token_Exchange_Rate.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_Token_Exchange_Rate.onEndConnection = ^{
        
    };
    [GET_Token_Exchange_Rate sendRequest];
}

@end
