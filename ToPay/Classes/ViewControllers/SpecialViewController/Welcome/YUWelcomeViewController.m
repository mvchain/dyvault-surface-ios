//
//  YUWelcomeViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUWelcomeViewController.h"
#import "YULoginViewController.h"
#import "YURegisterViewController.h"
@interface YUWelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@end

@implementation YUWelcomeViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark priavte method

#pragma mark public method
- (void)initSubviews {
    [super initSubviews];
    [self.loginButton yu_fullPurpleCircleStyle];
    [self.registerButton yu_fullBlueCircleStyle];
    [self addNormalNavBar:@"开始"];
}

#pragma mark - IBAction , event
- (IBAction)loginTap:(id)sender {
    [QuickDo pushViewControllerFromParentVc:self childClass:YULoginViewController.class];
}
- (IBAction)registerTap:(id)sender {
    [QuickDo pushViewControllerFromParentVc:self childClass:YURegisterViewController.class];
}

@end
