//
//  YUWelcomeViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUWelcomeViewController.h"

@interface YUWelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation YUWelcomeViewController
#pragma mark - lif cycle
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
    
    
    
    
}
- (IBAction)registerTap:(id)sender {
    
}

@end
