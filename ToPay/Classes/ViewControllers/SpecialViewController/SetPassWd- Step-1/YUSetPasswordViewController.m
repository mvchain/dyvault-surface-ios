//
//  YUSetPasswordViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUSetPasswordViewController.h"
#import "YUCircleTextView.h"
#import "API_POST_Register.h"

@interface YUSetPasswordViewController ()
@property (weak, nonatomic) IBOutlet YUCircleTextView *loginPasswordTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *payPasswordTextView;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@end

@implementation YUSetPasswordViewController
#pragma mark - <life cycle>

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self.confirmButton yu_gradualBlueChangeStyle];
    [self.loginPasswordTextView yu_loginPassWordStyle];
    [self.payPasswordTextView yu_payPasswordStyle];
    [self.loginPasswordTextView setPlaceHolder:@"登录密码"];
    [self.payPasswordTextView setPlaceHolder:@"支付密码"];
}
#pragma mark - <private method>


#pragma mark - <event response>
- (IBAction)confirmTap:(id)sender {
    if (self.loginPasswordTextView.text.length == 0) {
        [QMUITips showError:@"登录不能为空"];
        return;
    }
    if (self.loginPasswordTextView.text.length == 0) {
        [QMUITips showError:@"支付密码不能为空"];
        return;
    }
    API_POST_Register *POST_Register = [[API_POST_Register alloc] init];
    [QMUITips showLoadingInView:self.view hideAfterDelay:5];
    POST_Register.onSuccess = ^(id responseData) {
        NSDictionary *data = (NSDictionary *)responseData;
        UserIDCardModel *userIDCard = [[UserIDCardModel alloc]initWithDictionary:data];
        [[YUUserManagers shareInstance] change_userIDCard_inDisk:userIDCard];
        UIViewController *tabVc = [[YUViewControllerManagers shareInstance] getNewMainTabViewController ];
        
        [[YUCurrencyManager shareInstance] updateExchangeRate:^(BOOL isSucc) {
            
            [QMUITips showSucceed:@"注册成功"];
            [tabVc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:tabVc animated:YES completion:^{
                
            }];
            
        }];
        
    };
    POST_Register.onError = ^(NSString *reason, NSInteger code) {
         
        [QMUITips showError:reason];
    };
    POST_Register.onEndConnection = ^{
       [QMUITips hideAllTipsInView:self.view];
    };
    self.regRequestDataModel.password = self.loginPasswordTextView.text;
    self.regRequestDataModel.transactionPassword = self.payPasswordTextView.text;
    [POST_Register sendRequestWithEmail:self.regRequestDataModel.email
                             inviteCode:@""
                               nickname:self.regRequestDataModel.nickname
                               password:self.regRequestDataModel.password
                                   salt:[QuickGet getUUID]
                                  token:self.regRequestDataModel.token
                    transactionPassword:self.regRequestDataModel.transactionPassword];
}

@end
