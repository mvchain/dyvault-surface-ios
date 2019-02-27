//
//  ServModel.h
//  English
//
//  Created by jimi on 2018/5/10.
//  Copyright © 2018年 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUNetworkManager.h"
#define SERVER_DOMAIN  @"https://jianjiaomao.com"
#define SERVER_APP_ID @"10001"
#define SERVER_APP_VERSION @"1.0"
/*
 * ServModelState_ConnectionError -> for example:network error,server shutdown etc
 * ServModelState_BusinessLogicError ->for example:parameter error ,login fail,register fail
 * ServModelState_Success - > success 
 */
typedef NS_ENUM(NSUInteger, ServModelState) {
    ServModelState_ConnectionError,
    ServModelState_BusinessLogicError,
    ServModelState_Success
};

typedef void(^succBlock)(id data );

typedef void(^errBlock)(NSString *reason ,NSInteger code  );
@interface ServModel : NSObject
// api domain ,for example :@"https://mvc.com",note: "https" can not lack
@property (copy,nonatomic) NSString * apiDomainUrl ;
// api path,for example :@"/api/sendMessage"
@property (copy,nonatomic) NSString * apiPath ;
// api body reuqst url
@property (strong,nonatomic) NSMutableDictionary * requestDict ;
// write code in this block when request  succ
@property (copy,nonatomic) succBlock onSuccess ;
// write code in this block when request  err
@property (copy,nonatomic) errBlock onError ;
// default request
- (void)conn:(void(^)(NSDictionary *resData))succ
requestMethod:(HTTPMethod)rquestMethod
         err:(void(^)(NSString * reason , NSInteger code  ))err;

@end
