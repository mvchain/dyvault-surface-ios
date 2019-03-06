//
//  YUCurrencyManager.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCurrencyManager.h"

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

+(void)setRequestToken
{
    [[WYNetworkManager sharedManager] sendGetRequest:WYJSONRequestSerializer url:@"token" success:^(id responseObject, BOOL isCacheObject)
     {
         TPCurrencyList *currencyList = [TPCurrencyList mj_objectWithKeyValues:responseObject];
         
         YYCache *listCache = [YYCache cacheWithName:TPCacheName];
         
         [listCache setObject:currencyList forKey:TPCurrencyListKey];
         for (int i = 0 ; i <currencyList.data.count ; i++)
         {
             CLData *clData = currencyList.data[i];
             
             [listCache setObject:clData forKey:currencyList.data[i].tokenId];
         }
     }
                                             failure:^(NSURLSessionTask *task, NSError *error, NSInteger statusCode)
     {
         NSLog(@"请求币种列表失败：error = %@", error);
     }];
}

+(void)setRequestTokenBase
{
    [[WYNetworkManager sharedManager] sendGetRequest:WYJSONRequestSerializer url:@"token/base" success:^(id responseObject, BOOL isCacheObject)
     {
         NSLog(@"responseObject = %@", responseObject);
         
         NSArray<TPCurrencyRatio *> *currencyRatio = [TPCurrencyRatio mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
         
         YYCache *listCache = [YYCache cacheWithName:TPCacheName];
         [listCache setObject:currencyRatio forKey:TPCurrencyRatioKey];
     }
                                             failure:^(NSURLSessionTask *task, NSError *error, NSInteger statusCode)
     {
         NSLog(@"error = %@", error);
     }];
}

+(void)setRequestInfo
{
    [[WYNetworkManager sharedManager] sendGetRequest:WYJSONRequestSerializer url:@"user/info" success:^(id responseObject, BOOL isCacheObject)
     {
         NSLog(@"data:%@",responseObject[@"data"]);
         TPUserInfo *TPInfo = [TPUserInfo mj_objectWithKeyValues:responseObject[@"data"]];
         
         YYCache *listCache = [YYCache cacheWithName:TPCacheName];
         [listCache setObject:TPInfo forKey:TPUserInfoKey];
     }
                                             failure:^(NSURLSessionTask *task, NSError *error, NSInteger statusCode)
     {
         NSLog(@"获取用户信息失败：error = %@", error);
     }];
}

+(void)requestExchangeRate
{
    [[WYNetworkManager  sharedManager] sendGetRequest:WYJSONRequestSerializer url:@"token/exchange/rate" success:^(id responseObject, BOOL isCacheObject)
     {
         if ([responseObject[@"code"] isEqual:@200])
         {
             NSDictionary *dic = responseObject[@"data"];
             
             NSLog(@"%@",responseObject[@"data"]);
             NSArray<TPExchangeRate *> *exchanges = [TPExchangeRate mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
             NSLog(@"%@",responseObject[@"data"]);
             
             YYCache *listCache = [YYCache cacheWithName:TPCacheName];
             [listCache setObject:exchanges forKey:TPLegalCurrencyListKey];
             
             for (int i = 0 ; i <exchanges.count ; i++)
             {
                 TPExchangeRate *exRate = exchanges[i];
                 [listCache setObject:exRate.value forKey:exRate.name];
             }
             *ratioM = exchanges[0];TPExchangeRate
             [USER_DEFAULT setObject:ratioM.value forKey:TPNowLegalCurrencyKey];
             [USER_DEFAULT setObject:[ratioM.name substringToIndex:1] forKey:TPNowLegalSymbolKey];
             [USER_DEFAULT setObject:ratioM.name forKey:TPNowLegalNameKey];
             
             [TPNotificationCenter postNotificationName:TPLegalSwitchNotification object:nil];
             
         }
     }
                                              failure:^(NSURLSessionTask *task, NSError *error, NSInteger statusCode)
     {
         NSLog(@"获取法币汇率失败 %@",error);
     }];
}

@end
