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
+ (instancetype) shareInstance;
- (UIViewController *) getNewMainTabViewController;
- (UIViewController *) windowsRootViewController ;

@end

NS_ASSUME_NONNULL_END
