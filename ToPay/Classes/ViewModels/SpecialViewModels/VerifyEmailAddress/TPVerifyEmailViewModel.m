//
//  TPVerifyEmailViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "TPVerifyEmailViewModel.h"
#import "API_GET_User_Email.h"
#import "API_POST_User_Email.h"

@implementation TPVerifyEmailViewModel

- (void)sendVaildCodeWithcomplete:(void(^)(BOOL isSucc))complete {
    
    API_GET_User_Email *GET_User_Email =  [[API_GET_User_Email alloc] init];
    GET_User_Email.onSuccess = ^(id responseData) {
        complete(YES);
    };
    GET_User_Email.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_User_Email.onEndConnection = ^{
        
    };
    [GET_User_Email sendRequest];
}

- (void)checkoutWithVaildCode:(NSString *)vaildCode
                     complete:(void(^)(BOOL isVaild,NSString *token))complete {
    
    API_POST_User_Email *POST_User_Email = [[API_POST_User_Email alloc] init];
    POST_User_Email.onSuccess = ^(id responseData) {
        complete(YES,(NSString *)responseData);
    };
    POST_User_Email.onError = ^(NSString *reason, NSInteger code) {
        complete(NO,nil);
    };
    POST_User_Email.onEndConnection = ^{
        
    };
    [POST_User_Email sendRequestWithValicode:vaildCode];
    
}
- (NSString *)currentEmail {
    return [YUUserManagers shareInstance].userIDCard_inDisk.email;
}
@end
