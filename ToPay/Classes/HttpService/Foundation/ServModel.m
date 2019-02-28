//
//  ServModel.m
//  English
//
//  Created by jimi on 2018/5/10.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ServModel.h"

@implementation ServModel
- (id)init
{
    self = [super init];
    if(self){
        _apiDomainUrl = SERVER_DOMAIN;
    }
    return self;
}
- (void)connectWithRquestMethod:(HTTPMethod)rquestMethod
{
    [self updateHttpHeadToken];
    NSAssert(self.apiPath !=nil && self.apiPath.length > 0, @"  #### apiPath must not be null～@@@@@") ;
    NSAssert(self.onSuccess, @" ### onSuccess must not be null ~ @@@@");
    NSAssert(self.onError, @" ### onError must not be null ~ @@@@");
    [[YUNetworkManager defaultManager] sendRequestMethod:rquestMethod serverUrl:self.apiDomainUrl apiPath:self.apiPath parameters:self.requestDict progress:^(NSProgress * _Nullable progress) {
    } success:^(BOOL isSuccess, id  _Nullable responseObject) {
        NSDictionary *dict = (NSDictionary*)responseObject;
        if([dict[@"code"] intValue] == 200) {
            self.onSuccess(dict[@"data"]);
        }else {
            self.onError(dict[@"message"],[dict[@"code"] integerValue]);
        }
        self.onEndConnection();
    } failure:^(NSString * _Nullable errorMessage) {
        self.onError(errorMessage,-1);
        self.onEndConnection();
    }];
}

/* set newst token  */
- (void)updateHttpHeadToken
{
    NSString *authToken = [[YUUserManagers shareInstance] userIDCard_inDisk].token;
    if (!authToken) return; // no token exit
    
    YUNetworkManager *manager = [YUNetworkManager defaultManager];
    // token ,for every connect
    [ manager.sessionManager.requestSerializer setValue:authToken forHTTPHeaderField:@"Authorization"];
    // language
    [ manager.sessionManager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
    // buildVersion
    [ manager.sessionManager.requestSerializer setValue:[QuickGet getCurBuildVersion] forHTTPHeaderField:@"versionCode"];
}
- (NSMutableDictionary *) requestDict
{
    if(_requestDict)return _requestDict;
    _requestDict = [[NSMutableDictionary alloc]init];
    return _requestDict;
}
@end
