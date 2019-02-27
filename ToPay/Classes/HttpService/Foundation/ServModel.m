//
//  ServModel.m
//  English
//
//  Created by jimi on 2018/5/10.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import "ServModel.h"

@implementation ServModel
- (id)init{
    self = [super init];
    if(self){
        _apiDomainUrl = SERVER_DOMAIN;
    }
    return self;
}

- (void)conn:(void(^)(NSDictionary *resData))succ
requestMethod:(HTTPMethod)rquestMethod
         err:(void(^)(NSString * reason , NSInteger code  ))err {
    NSAssert(self.apiPath !=nil && self.apiPath.length > 0, @"  #### apiPath must not be null～@@@@@") ;
    
    [[YUNetworkManager defaultManager] sendRequestMethod:rquestMethod serverUrl:self.apiDomainUrl apiPath:self.apiPath parameters:self.requestDict progress:^(NSProgress * _Nullable progress) {
        
    } success:^(BOOL isSuccess, id  _Nullable responseObject) {
        NSDictionary *dict = (NSDictionary*)responseObject;
        if( [dict[@"code"] isEqualToString:@"0000"] ) {
            succ(dict[@"data"]);
        }else {
            err(dict[@"msg"],[dict[@"code"] integerValue]);
        }
    } failure:^(NSString * _Nullable errorMessage) {
        err(errorMessage,-1);
    }];
    
}
- ( NSMutableDictionary * ) requestDict{
 
    if(_requestDict)return _requestDict;
    _requestDict = [[NSMutableDictionary alloc]init];
    [_requestDict setObject:SERVER_APP_ID forKey:@"app_id"];
    [_requestDict setObject:SERVER_APP_VERSION forKey:@"app_version"];
    return _requestDict;
}
@end
