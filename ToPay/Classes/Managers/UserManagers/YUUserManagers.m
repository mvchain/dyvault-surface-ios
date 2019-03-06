//
//  YUUserManagers.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUUserManagers.h"
#import "API_GET_User_Info.h"
#import "TPUserInfo.h"

@implementation YUUserManagers
static YUUserManagers* _instance = nil;

#pragma mark -<public method>
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
    return [YUUserManagers shareInstance] ;
}
- (id)copyWithZone:(struct _NSZone *)zone
{
    return [YUUserManagers shareInstance] ;
}
- (void)change_userIDCard_inDisk:(UserIDCardModel *)model {
    YYCache *cache = [YYCache cacheWithName:UserInfoCacheKey];
    [cache setObject:model forKey:UserInfoCacheKey_IDCard];
}
- (UserIDCardModel *)userIDCard_inDisk {
    YYCache *cache = [YYCache cacheWithName:UserInfoCacheKey];
    return (UserIDCardModel*)[cache objectForKey:UserInfoCacheKey_IDCard];
}
- (void)logout {
    YYCache *cache = [YYCache cacheWithName:UserInfoCacheKey];
    [cache removeAllObjects];
}
- (BOOL)isLogined {
    return self.userIDCard_inDisk?YES:NO;
}
- (void)updateUserInfo:(void(^)(BOOL isSucc))complete {
    API_GET_User_Info *GET_User_Info = [[API_GET_User_Info alloc] init];
    GET_User_Info.onSuccess = ^(id responseData) {
        NSDictionary *data = (NSDictionary *)responseData;
        TPUserInfo *TPInfo = [TPUserInfo mj_objectWithKeyValues:data];
        YYCache *listCache = [YYCache cacheWithName:TPCacheName];
        [listCache setObject:TPInfo forKey:TPUserInfoKey];
        complete(YES);
    };
    GET_User_Info.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_User_Info.onEndConnection = ^{
        complete(NO);
    };
    [GET_User_Info sendRequest];
}

- (TPUserInfo *)nowUserInfo {
    YYCache *listCache = [YYCache cacheWithName:TPCacheName];
    TPUserInfo *info = (TPUserInfo *)[listCache objectForKey:TPUserInfoKey];
    return info;
}
@end
