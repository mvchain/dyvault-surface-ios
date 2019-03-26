//
//  YUOTCHomeViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/20.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUOTCHomeViewController.h"

@interface YUOTCHomeViewController ()

@end

@implementation YUOTCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UIWindow *win =  UIApplication.sharedApplication.keyWindow;
    win.rootViewController = [[YUViewControllerManagers shareInstance] auto_windowsRootViewController];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    
}
@end
