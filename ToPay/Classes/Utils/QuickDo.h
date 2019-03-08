//
//  QuickDo.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuickDo : NSObject
+ (void)pushViewControllerFromParentVc:(UIViewController *)parentVc child:(UIViewController *)childVc;
+ (void)pushViewControllerFromParentVc:(UIViewController *)parentVc childClass:(Class)cls;
+ (void)shareToSystem:(NSArray *)items target:(id)target success:(void(^)(bool isok))successBlock;
@end

NS_ASSUME_NONNULL_END
