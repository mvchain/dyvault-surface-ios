//
//  AppDelegate.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "AppDelegate.h"
#import "YUWelcomeViewController.h"
#import "API_POST_User_Salt.h"
#import "testVC.h"
@interface AppDelegate ()
@end

@implementation AppDelegate
#pragma mark private method
- (void)setUpWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    UINavigationController *nav = [[UINavigationController alloc] init];
//    nav.viewControllers = @[[[YUWelcomeViewController alloc] init]];
//    nav.navigationBar.hidden = YES;
//    self.window.rootViewController = [[YUViewControllerManagers shareInstance] auto_windowsRootViewController];
    self.window.rootViewController = [[testVC alloc] init];
    [self.window makeKeyAndVisible];
}

#pragma mark life cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setUpWindow];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   

}



@end
