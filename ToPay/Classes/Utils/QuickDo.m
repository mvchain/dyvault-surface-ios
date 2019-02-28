//
//  QuickDo.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "QuickDo.h"


@implementation QuickDo
+ (void)pushViewControllerFromParentVc:(UIViewController *)parentVc child:(UIViewController *)childVc;
{
    [parentVc.navigationController pushViewController:childVc animated:YES];
    
}
+ (void)pushViewControllerFromParentVc:(UIViewController *)parentVc childClass:(Class)cls;
{
    if ([cls isSubclassOfClass:UIViewController.class]) {
        UIViewController *newVc = [[cls alloc] init];
        [parentVc.navigationController pushViewController:newVc animated:YES];
    }
    
    
}
@end
