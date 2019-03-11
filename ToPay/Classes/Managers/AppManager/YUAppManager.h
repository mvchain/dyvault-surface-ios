//
//  YUAppManager.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/11.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YUAppManager : NSObject
+ (instancetype) shareInstance;
- (void)refreshServerAppVersion:(void(^)(BOOL isSucc))complete;
- (void)isShouldUpdate:(void(^)(BOOL shouldUpdae,BOOL isNetOk))complete;
- (void)setAppServerBuildVersion:(NSInteger)buildVersion ;
- (NSInteger)appServerBuildVersion;
- (NSString *)appDomainUrl;
- (BOOL)isReleaseVersion ;
- (NSInteger)mostRecentNewsTimeInLocal;
- (void) setMostRecentNewsInLocalWithTime:(NSInteger)time;


@end

NS_ASSUME_NONNULL_END
