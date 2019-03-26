//
//  YUBaseViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUBaseViewController.h"
#import "UIImage+Gradient.h"
@interface YUBaseViewController ()
@end
@implementation YUBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"\n\n------😄----- enter into: \n\n %@  \n\n ----------***-------",NSStringFromClass(self.class));
    
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view {
    // 子类重写，默认返回 NO，也即不主动干预键盘的状态
    return YES;
}

- (void)addNormalNavBar:(NSString *)title{
    
    [self.normalNavbar.titleLabel setText:title];
    [self.view addSubview:self.normalNavbar];
}

- (YUNormalNavBarView *)normalNavbar{
    if(_normalNavbar)return _normalNavbar;
    _normalNavbar = [YUCustomNavBarView normalNavBarView];
    return _normalNavbar;
}
- (void)dealloc {
    NSLog(@"\n\n------💀----- dealloc: \n\n %@  \n\n ----------***-------",NSStringFromClass(self.class));
}
@end
