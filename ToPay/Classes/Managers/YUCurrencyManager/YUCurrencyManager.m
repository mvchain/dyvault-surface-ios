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
#import "API_GET_Token.h"
#import "AddNewTokenItemModel.h"
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


- (void)setNowLegalCurrency:(TPExchangeRate *)ratioM {
    [USER_DEFAULT setObject:ratioM.value forKey:TPNowLegalCurrencyKey];
    [USER_DEFAULT setObject:[ratioM.name substringToIndex:1] forKey:TPNowLegalSymbolKey];
    [USER_DEFAULT setObject:[ratioM.name substringFromIndex:1] forKey:TPNowLegalNameKey];
    [TPNotificationCenter postNotificationName:TPLegalSwitchNotification object:nil];
}
// currenct currencyName ,for exp : USD ,RMB EUR
- (NSString *)nowLegalCurrencyName {
    return [USER_DEFAULT objectForKey:TPNowLegalNameKey];
    
}
// currenct ratio
- (CGFloat)nowLegalCurrencyRatio {
    return [[USER_DEFAULT objectForKey:TPNowLegalCurrencyKey] doubleValue];
}
// current flag , for exp :$
- (NSString *)nowLegalCurrencyFlag {
     return [USER_DEFAULT objectForKey:TPNowLegalSymbolKey];
}

//- (void)updateRequestTokenBase:(void(^)(BOOL isSucc))complete {
//    API_GET_Token_Base *GET_Token_Base = [[API_GET_Token_Base alloc] init];
//    GET_Token_Base.onSuccess = ^(id responseData) {
//        NSDictionary *data = (NSDictionary *)responseData;
//        NSArray<TPCurrencyRatio *> *currencyRatios = [TPCurrencyRatio mj_objectArrayWithKeyValuesArray:data];
//        YYCache *listCache = [YYCache cacheWithName:TPCacheName];
//        [listCache setObject:currencyRatios forKey:TPCurrencyRatioKey];
//        complete(YES);
//    };
//    GET_Token_Base.onError = ^(NSString *reason, NSInteger code) {
//        complete(NO);
//    };
//    GET_Token_Base.onEndConnection = ^{
//
//    };
//    [GET_Token_Base sendRequest];
//}
- (BOOL)isTokenVisable:(NSInteger)tokenID {
    NSArray<AddNewTokenItemModel *> *arrs = [self tokenCurrencyList];
    for (AddNewTokenItemModel *model in arrs) {
        if (model.tokenId == tokenID && model.visible == 0) return NO;
    }
    return YES;
}
- (NSArray<AddNewTokenItemModel *> *)tokenCurrencyList {
    YYCache *listCache = [YYCache cacheWithName:TPCacheName];
    return (NSArray<AddNewTokenItemModel *> *)[listCache objectForKey:TPTokenCurrencyListKey];
}
- (void)requestTokenListInfo:(void(^)(NSArray<AddNewTokenItemModel *> * models , BOOL isSucc))complete {
    API_GET_Token *GET_Token = [[API_GET_Token alloc] init];
    GET_Token.onSuccess = ^(id responseData) {
        NSArray *resArr = (NSArray *)responseData;
        NSMutableArray <AddNewTokenItemModel *> *items = [[NSMutableArray alloc] init];
        YYCache *listCache = [YYCache cacheWithName:TPCacheName];
        for (NSDictionary *dic in resArr) {
            AddNewTokenItemModel *model = [[AddNewTokenItemModel alloc] initWithDictionary:dic];
            [[YULanguageManagers shareInstance] setTokenFullNameByTokenName:model.tokenName
                                                                fullName_en:model.tokenEnName
                                                                fullName_cn:model.tokenCnName];
            [items addObject:model];
        }
        [listCache setObject:items forKey:TPTokenCurrencyListKey];
        complete(items,YES);
    };
    GET_Token.onError = ^(NSString *reason, NSInteger code) {
        
        complete(nil,NO);
    };
    GET_Token.onEndConnection = ^{
        
    };
    [GET_Token sendRequest];
    
}
/* law currency  */

- (NSArray <TPExchangeRate *>*)legalCurrencyListArrays {
    YYCache *listCache = [YYCache cacheWithName:TPCacheName];
    NSArray <TPExchangeRate *>*listArr = (NSArray<TPExchangeRate *> *)[listCache objectForKey:TPLegalCurrencyListKey];
    return listArr;
}
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
