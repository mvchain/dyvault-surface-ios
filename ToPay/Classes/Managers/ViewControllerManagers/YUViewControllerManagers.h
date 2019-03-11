//
//  YUViewControllerManagers.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YUViewControllerManagers : NSObject
@property (strong,nonatomic) NSArray<UINavigationController *> *navgations;
+ (instancetype) shareInstance;
- (UIViewController *) getNewMainTabViewController;
- (UIViewController *) auto_windowsRootViewController;
- (void)clearUserInfo_AndExit;
@end

NS_ASSUME_NONNULL_END
