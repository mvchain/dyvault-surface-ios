//
//  TPBindEmailViewModel.m
//  ToPay
//
//  Created by 蒲公英 on 2019/1/17.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "YUReBindEmailViewModel.h"
#import "API_GET_User_Email_Logout.h"
#import "API_PUT_User_Email.h"
@implementation YUReBindEmailViewModel
- (void)sendVaildCodeByEmail:(NSString *)emailAddr
                    complete:(void(^)(BOOL isSucc))complete {
    API_GET_User_Email_Logout *GET_User_Email_Logout = [[API_GET_User_Email_Logout alloc] init];
    GET_User_Email_Logout.onSuccess = ^(id responseData) {
        complete(YES);
    };
    GET_User_Email_Logout.onError = ^(NSString *reason, NSInteger code) {
        complete(NO);
    };
    GET_User_Email_Logout.onEndConnection = ^{
        
    };
    [GET_User_Email_Logout sendRequestWithEmail:emailAddr];
}
- (void)rebindEmail:(NSString *)email
              token:(NSString *)token
           valiCode:(NSString *)valiCode
           complete:(void (^)(BOOL isSucc,NSString *info))complete {
    API_PUT_User_Email *PUT_User_Email = [[API_PUT_User_Email alloc] init];
    PUT_User_Email.onSuccess = ^(id responseData) {
        complete(YES,nil);
    };
    PUT_User_Email.onError = ^(NSString *reason, NSInteger code) {
        complete(NO,reason);
    };
    PUT_User_Email.onEndConnection = ^{
        
    };
    [PUT_User_Email sendRequestWithEmail:email
                                   token:token
                               validcode:valiCode];
}
@end
