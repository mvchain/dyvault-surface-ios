//
//  YUUserManagers.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YUUserManagers : NSObject


+ (instancetype) shareInstance;

// change userIDCard 
- (void)change_userIDCard_inDisk:(UserIDCardModel *)model;
// get userIDCard
- (UserIDCardModel *)userIDCard_inDisk;

- (void)logout;
- (BOOL)isLogined;

@end

NS_ASSUME_NONNULL_END
