//
//  TPAboutViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2018/11/16.
//  Copyright © 2018年 蒲公英. All rights reserved.
//

#import "TPAboutViewController.h"
#import "YFactoryUI.h"
#import "UIViewExt.h"
#import "YUAppManager.h"
// #import "YUAlertViewController.h"

@interface TPAboutViewController ()

@end

@implementation TPAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = TPF6Color;
    
    NSString *title = [[YUAppManager shareInstance] isReleaseVersion]?Localized(@"about_us"):TPString(@"%@ (Beta)",Localized(@"about_us"));
    [self addNormalNavBar:title];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self setUpViews];
}

- (void)setUpViews
{
   UIImageView *iconImgV = [YFactoryUI YImageViewWithimage:[UIImage imageNamed:@"icon"]];
    [self.view addSubview:iconImgV];
    
    [iconImgV mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@144);
        make.size.equalTo(@60);
    }];
    
    UILabel *descLab = [YFactoryUI YLableWithText:TPString(@"%@1.0",Localized(@"Current version")) color:TP59Color font:FONT(12)];
    [self.view addSubview:descLab];
    [descLab mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view);
         make.top.equalTo(iconImgV.mas_bottom).with.offset(20);
         make.height.equalTo(@16);
    }];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:Localized(@"Check for updates") forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@44);
    }];
    [btn addTarget:self action:@selector(updateNew:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)updateNew:(id)sender {
   
    [[YUAppManager shareInstance] isShouldUpdate:^(BOOL shouldUpdae, BOOL isNetOk) {
        if (!isNetOk) {
            [QMUITips showError:Localized(@"network error")];
            return ;
        }
        if (shouldUpdae) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:Localized(@"friendly_tips")
                                                                                     message:Localized(@"New version found, do you want to update it?")
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *resetAction = [UIAlertAction actionWithTitle:Localized(@"Update immediately") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
                                          
                                          {
                                             
                                          }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:Localized(@"cancel")
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:resetAction];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }else {
            [QMUITips showSucceed:Localized(@"Already the latest version")];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
