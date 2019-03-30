//
//  YUAppManager.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/11.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUAppManager.h"
#import "API_GET_App.h"
@implementation YUAppManager
static YUAppManager* _instance = nil;
+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [YUAppManager shareInstance] ;
}
- (id)copyWithZone:(struct _NSZone *)zone
{
    return [YUAppManager shareInstance] ;
}
- (void)refreshServerAppVersion:(void(^)(BOOL isSucc))complete {
    API_GET_App *GET_App = [[API_GET_App alloc] init];
    GET_App.onSuccess = ^(id responseData) {
        //[3]    (null)    @"appVersionCode" : (long)2
        NSDictionary *res = (NSDictionary *)responseData;
        NSInteger build = [res[@"appVersionCode"] integerValue];
        [self setAppServerBuildVersion:build];
        complete(YES);
    };
    GET_App.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_App.onEndConnection = ^{
        
    };
    [GET_App sendRequest];
    
}
- (void)isShouldUpdate:(void(^)(BOOL shouldUpdae,BOOL isNetOk))complete {
    
    [self refreshServerAppVersion:^(BOOL isSucc) {
        if (!isSucc) {
            complete(NO,NO);
            return ;
        }
        NSInteger curAppVersion = [QuickGet getCurBuildVersion];
        NSInteger serverAppVersion = [self appServerBuildVersion];
        complete(curAppVersion < serverAppVersion ,YES);
    }];
}
- (void)setAppServerBuildVersion:(NSInteger)buildVersion {
    [[NSUserDefaults standardUserDefaults] setObject:@(buildVersion) forKey:APP_SERVER_VERSION_KEY];
}

- (NSInteger)appServerBuildVersion {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:APP_SERVER_VERSION_KEY] integerValue];
}

- (BOOL)isReleaseVersion {

    return  ([[QuickGet getBundleIdStr] isEqualToString:@"release.dyvault.ToPay"]);
}
- (NSString *)appDomainUrl {
    
    NSString *test =  @"http://47.110.144.216/api/app";
    NSString *production = @"http://54.238.152.0/api/app";
    return [self isReleaseVersion]?production:test;
}
- (NSInteger)mostRecentNewsTimeInLocal {
    //@"MOST_RECENT_MSG_TIME"
    NSNumber *num = [[NSUserDefaults standardUserDefaults] objectForKey:@"MOST_RECENT_MSG_TIME"] ;
    if (!num)return 0;
    return num.integerValue;
}
- (void) setMostRecentNewsInLocalWithTime:(NSInteger)time {
    [[NSUserDefaults standardUserDefaults] setObject:@(time) forKey:@"MOST_RECENT_MSG_TIME"];
}
@end
