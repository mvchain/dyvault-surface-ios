//
//  YUUserManagers.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUUserManagers.h"
#define UserInfoCacheKey @"UserCacheKey"
#define UserInfoCacheKey_IDCard @"UserCacheKey_IDCard"
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


@end
