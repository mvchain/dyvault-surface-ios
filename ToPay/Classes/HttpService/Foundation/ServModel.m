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
        _apiDomainUrl = [[YUAppManager shareInstance] appDomainUrl];
    }
    return self;
}
- (void)connectWithRquestMethod:(HTTPMethod)rquestMethod
{
    [self updateHttpHeadTokenForEachAPI];
    NSAssert(self.apiPath !=nil && self.apiPath.length > 0, @"  #### apiPath must not be null～@@@@@") ;
    NSAssert(self.onSuccess, @" ### onSuccess must not be null ~ @@@@");
    NSAssert(self.onError, @" ### onError must not be null ~ @@@@");
    NSAssert(self.onEndConnection, @" ### onEndConnection must not be null ~ @@@@");
    NSURLSessionDataTask * _Nullable extractedExpr = [[YUNetworkManager defaultManager] sendRequestMethod:rquestMethod
                                                                                                serverUrl:self.apiDomainUrl
                                                                                                  apiPath:self.apiPath
                                                                                               parameters:self.requestDict progress:^(NSProgress * _Nullable progress) {
                                                                                               }
                                                                                                  success:^(BOOL isSuccess, id  _Nullable responseObject) {
                                                                                                      NSDictionary *dict = (NSDictionary*)responseObject;
                                                                                                      if([dict[@"code"] intValue] == 200) {
                                                                                                          self.onSuccess(dict[@"data"]);
                                                                                                      }else {
                                                                                                          self.onError(dict[@"message"],[dict[@"code"] integerValue]);
                                                                                                      }
                                                                                                      self.onEndConnection();
                                                                                                  } failure:^(NSString * _Nullable errorMessage, NSInteger responseCode) {
                                                                                                      if (responseCode == 401) {
                                                                                                          [self refreshToken:^(BOOL isRefreshSucc, BOOL isNetOK) {
                                                                                                              if (!isNetOK) return ; // net err ,exit
                                                                                                              if (!isRefreshSucc) {
                                                                                                                  // refresh error ,exit
                                                                                                                  [[YUViewControllerManagers shareInstance] clearUserInfo_AndExit] ; // exit
                                                                                                                  return;
                                                                                                              }
                                                                                                              if (![[YUUserManagers shareInstance] isLogined]) {
                                                                                                                  return;
                                                                                                              }
                                                                                                              // refresh succ
                                                                                                              [self connectWithRquestMethod:rquestMethod];
                                                                                                          }];
                                                                                                          return ;
                                                                                                      }
                                                                                                      // not 401
                                                                                                      self.onError(errorMessage,responseCode);
                                                                                                      self.onEndConnection();
                                                                                                  }];
    extractedExpr;
}

/* set newst token  */
- (void)updateHttpHeadTokenForEachAPI
{
    NSString *authToken = [[YUUserManagers shareInstance] userIDCard_inDisk].token;
   
    if (!authToken) return; // no token exit
    YUNetworkManager *manager = [YUNetworkManager defaultManager];
    // token ,for every connect
    [ manager.sessionManager.requestSerializer setValue:authToken forHTTPHeaderField:@"Authorization"];
    // language
    [ manager.sessionManager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
    // buildVersion
    [ manager.sessionManager.requestSerializer setValue:@([QuickGet getCurBuildVersion]).stringValue forHTTPHeaderField:@"versionCode"];
}
// when token unvalid
- (void)refreshToken:(void(^)(BOOL isRefreshSucc ,BOOL isNetOK))complete{
    
    UserIDCardModel *idCardModel = [[YUUserManagers shareInstance] userIDCard_inDisk];
    NSString *refreshTokenStr = idCardModel.refreshToken;
    YUNetworkManager *manager = [YUNetworkManager defaultManager];
    // token ,for every connect
    [ manager.sessionManager.requestSerializer setValue:refreshTokenStr forHTTPHeaderField:@"Authorization"];
    // language
    [ manager.sessionManager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
    // buildVersion
    [ manager.sessionManager.requestSerializer setValue:@([QuickGet getCurBuildVersion]).stringValue forHTTPHeaderField:@"versionCode"];
    [[YUNetworkManager defaultManager] sendRequestMethod:HTTPMethodPOST serverUrl:self.apiDomainUrl apiPath:@"/user/refresh"  parameters:nil progress:^(NSProgress * _Nullable progress) {
        
    } success:^(BOOL isSuccess, id  _Nullable responseObject) {
        NSDictionary *resDict = (NSDictionary *)responseObject;
        NSString *apiToken = resDict[@"data"];
        idCardModel.token = apiToken;
        [[YUUserManagers shareInstance] change_userIDCard_inDisk:idCardModel]; // save ,to disk
        complete([resDict[@"code"]intValue] == 200,YES);
      
    } failure:^(NSString * _Nullable errorMessage, NSInteger responseCode) {
        complete(NO,NO); // net err
    }];
}

- (NSMutableDictionary *) requestDict
{
    if(_requestDict)return _requestDict;
    _requestDict = [[NSMutableDictionary alloc]init];
    return _requestDict;
}
@end
