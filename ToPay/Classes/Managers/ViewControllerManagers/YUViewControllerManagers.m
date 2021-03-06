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
#import "YUNavigationViewController.h"
#import "YUOTCHomeViewController.h"
@interface YUViewControllerManagers()


@end
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
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [YUViewControllerManagers shareInstance] ;
}
- (id)copyWithZone:(struct _NSZone *)zone
{
    return [YUViewControllerManagers shareInstance] ;
}
- (void)clearUserInfo_AndExit {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[YUUserManagers shareInstance] logout];
    window.rootViewController = [self auto_windowsRootViewController];
}

- (UIViewController *) getNewMainTabViewController {
    /* asset */
    YUNavigationViewController *nav0 = [[YUNavigationViewController alloc]init];
    UIViewController *vc0 = [[YUAssetViewController alloc]init];
    nav0.viewControllers = @[vc0];
    nav0.navigationBar.hidden = YES;
    UIImage *asset_un = [[UIImage imageNamed:@"assets_unselected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *asset_selected = [[UIImage imageNamed:@"assets_selected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav0.tabBarItem = [self tabBarItemWithTitle:Localized(@"capital")
                                          image:asset_un
                                  selectedImage:asset_selected tag:1];
    

    /* mine */
    YUNavigationViewController *nav2 = [[YUNavigationViewController alloc]init];
    UIViewController *vc2= [[YUMineViewController alloc]init];
    nav2.viewControllers = @[vc2];
    UIImage *mine_un = [[UIImage imageNamed:@"mine_unselected_icon"]
                        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mine_selected = [[UIImage imageNamed:@"mine_selected_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem = [self tabBarItemWithTitle:Localized(@"mine")
                                          image:mine_un
                                  selectedImage:mine_selected tag:1];
   
    /* tab  */
    QMUITabBarViewController *tabVc = [[QMUITabBarViewController alloc] init];
    tabVc.viewControllers = @[nav0,nav2];
    tabVc.tabBar.clipsToBounds = YES; // no line style
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateLanguage)
                                                 name:NotiChangeLanguage
                                               object:nil];
    
    
    _navgations = @[nav0,nav2];
    return tabVc;
}

- (UIViewController *) auto_windowsRootViewController {
    if ([YUUserManagers shareInstance].isLogined) {
        UIViewController *isLoginVC = [self getNewMainTabViewController];
        return isLoginVC;
    }else {
        UINavigationController *unLoginNav = [[UINavigationController alloc]init];
        UIViewController *unLoginVC = [[YULoginViewController alloc] init];
        unLoginNav.viewControllers = @[unLoginVC];
        return unLoginNav;
    }
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

- (void)updateLanguage {
    _navgations[0].tabBarItem.title = Localized(@"capital");
    _navgations[1].tabBarItem.title = Localized(@"mine");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
