//
//  YUViewControllerManagers.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/1.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUViewControllerManagers.h"
#import <CYLTabBarController.h>
#import "YUAssetViewController.h"
#import "YUMineViewController.h"
#import "YULoginViewController.h"
@implementation YUViewControllerManagers
static YUViewControllerManagers* _instance = nil;


#pragma mark - <public method >
+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

- (UIViewController *) getNewMainTabViewController {
    /* asset */
    UINavigationController *nav0 = [[UINavigationController alloc]init];
    UIViewController *vc0 = [[YUAssetViewController alloc]init];
    nav0.viewControllers = @[vc0];
    nav0.navigationBar.hidden = YES;
    UIImage *asset_un = [[UIImage imageNamed:@"assets_unselected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *asset_selected = [[UIImage imageNamed:@"assets_selected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav0.tabBarItem = [self tabBarItemWithTitle:@"资产"
                                          image:asset_un
                                  selectedImage:asset_selected tag:1];
    /* mine */
    UINavigationController *nav1 = [[UINavigationController alloc]init];
    UIViewController *vc1 = [[YUMineViewController alloc]init];
    nav1.viewControllers = @[vc1];
    UIImage *mine_un = [[UIImage imageNamed:@"mine_unselected_icon"]
                        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mine_selected = [[UIImage imageNamed:@"mine_selected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem = [self tabBarItemWithTitle:@"我的"
                                          image:mine_un
                                  selectedImage:mine_selected tag:1];
   
    /* tab  */
    QMUITabBarViewController *tabVc = [[QMUITabBarViewController alloc] init];
    tabVc.viewControllers = @[nav0,nav1];
    tabVc.tabBar.clipsToBounds = YES; // no line style
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    return tabVc;
}

- (UIViewController *) windowsRootViewController {
    UIViewController *isLoginVC = [self getNewMainTabViewController];
    UINavigationController *unLoginNav = [[UINavigationController alloc]init];
    UIViewController *unLoginVC = [[YULoginViewController alloc] init];
    unLoginNav.viewControllers = @[unLoginVC];
    return [YUUserManagers shareInstance].isLogined?isLoginVC:unLoginNav;
}
#pragma mark - <private method >
- (UITabBarItem *)tabBarItemWithTitle:(NSString *)title
                                image:(UIImage *)image
                        selectedImage:(UIImage *)selectedImage
                                  tag:(NSInteger)tag {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:tag];
    tabBarItem.selectedImage = selectedImage;
    return tabBarItem;
}

@end
