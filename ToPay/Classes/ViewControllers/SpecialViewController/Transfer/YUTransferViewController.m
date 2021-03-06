//
//  YUTransferViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/7.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUTransferViewController.h"
#import "YUCircleTextView.h"
#import "API_GET_Asset_Transaction.h"
#import "TransferBaseInfo.h"
#import "TPTransView.h"
#import "API_POST_Asset_Transaction.h"
#import "NIMScannerViewController.h"
#import "API_GET_Asset_inner.h"
@interface YUTransferViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *atly_scroll_top;
@property (weak, nonatomic) IBOutlet YUCircleTextView *addressTextView;
@property (weak, nonatomic) IBOutlet YUCircleTextView *totalNumberTextView;
@property (strong ,nonatomic) TransferBaseInfo *transferBaseInfo ;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *canUsingCashNumberLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *feeLabel;
@property (assign,nonatomic) BOOL isInnerUserAddr ;
@property (weak, nonatomic) IBOutlet UILabel *canUsingCacheTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *feeTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *noFeeTipLabel;

@end

@implementation YUTransferViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    self.addressTextView.text = self.defaultAddress;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
    self.totalNumberTextView.textField.placeholder = Localized(@"Type Amount");
    self.addressTextView.textField.placeholder = Localized(@"Type Address/User Email");
    self.canUsingCacheTipLabel.text = Localized(@"Balance");
    self.feeTipLabel.text = Localized(@"Handling fee");
    self.noFeeTipLabel.text = Localized(@"There is no charge for transferring/receiving between ToPay users");
    self.totalNumberTextView.textField.keyboardType = UIKeyboardTypeDecimalPad;
    self.atly_scroll_top.constant = self.normalNavbar.qmui_bottom + 50;
    [self.totalNumberTextView.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.totalNumberTextView).with.offset(-70);
    }];
    [self.confirmButton yu_gradualBlueChangeStyle];
    [self setInitData];
    [self setTextEvent];
    [self setNavEvent];
}
#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:Localized(@"transfer")];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"scan-qrcode")];
}
- (void)setInitData {
        API_GET_Asset_Transaction *GET_Asset_Transaction = [[API_GET_Asset_Transaction alloc] init];
        [QMUITips showLoadingInView:self.view hideAfterDelay:5.0];
        GET_Asset_Transaction.onSuccess = ^(id responseData) {
            TransferBaseInfo *info = [[TransferBaseInfo alloc] initWithDictionary:(NSDictionary *)responseData];
            self.transferBaseInfo = info;
            [self setBaseInfoToView:info];
        };
        GET_Asset_Transaction.onError = ^(NSString *reason, NSInteger code) {
            [QMUITips showError:reason];
        };
        GET_Asset_Transaction.onEndConnection = ^{
            [QMUITips hideAllTipsInView:self.view];
        };
        [GET_Asset_Transaction sendRequestWithTokenId:self.assetTokenModel.tokenId];
}

- (void)setBaseInfoToView:(TransferBaseInfo *)info {
    self.canUsingCashNumberLabel.text = TPString(@"%.4f %@",yufloat_token(info.balance),self.assetTokenModel.tokenName);
    self.totalNumberTipLabel.text = self.assetTokenModel.tokenName;
    self.feeLabel.text = TPString(@"%.6f %@",yufloat_fee(info.fee) ,info.feeTokenName);
}

#pragma mark - <event response>
- (void) setNavEvent {
    yudef_weakSelf
    self.normalNavbar.rightButton.onClick = ^(id sender ) {
        NIMScannerViewController * scannerVC = [[NIMScannerViewController alloc] initWithCardName:@"hahaha" avatar:nil completion:^(NSString *stringValue)
                                                {
                                                    weakSelf.addressTextView.textField.text = stringValue;
                                                    
                                                }];
        scannerVC.tokenid = @(weakSelf.assetTokenModel.tokenId).stringValue;
        [weakSelf presentViewController:scannerVC animated:YES completion:^{
            
        }];
    };
    
}
- (void)setTextEvent {
    yudef_weakSelf
    self.totalNumberTextView.onTextChange = ^(NSString * _Nonnull text) {
        NSString *tipStr = self.assetTokenModel.tokenName; // default
        UIColor *tipColor = [UIColor qmui_colorWithHexString:@"#555555"]; //// default
        BOOL isConfirmBtnVaild = YES;
        UIFont *font = [UIFont systemFontOfSize:18];
        if (text.length != 0) {
            CGFloat transNum = [text doubleValue];
            if (transNum > self.transferBaseInfo.balance) {
                tipStr = @"余额不足";
                tipColor = [UIColor redColor];
                isConfirmBtnVaild = NO;
                font = [UIFont systemFontOfSize:13.0];
            }
        }
        self.totalNumberTipLabel.text = tipStr;
        self.totalNumberTipLabel.textColor = tipColor;
        self.confirmButton.enabled = isConfirmBtnVaild;
        [self.totalNumberTipLabel setFont:font];
    };
    
    self.addressTextView.onTextDidEndEditing = ^(UITextField * _Nonnull sender) {
        NSString *addr = sender.text;
        API_GET_Asset_inner *GET_Asset_inner = [[API_GET_Asset_inner alloc] init];
        GET_Asset_inner.onSuccess = ^(id responseData) {
           BOOL isInneAddr =  [responseData boolValue];
            weakSelf.isInnerUserAddr = isInneAddr;
           if (isInneAddr) {
               weakSelf.feeLabel.text = TPString(@"%.6f %@",0.0 ,weakSelf.transferBaseInfo.feeTokenName);
           }else {
               weakSelf.feeLabel.text = TPString(@"%.6f %@",yufloat_fee(weakSelf.transferBaseInfo.fee) ,weakSelf.transferBaseInfo.feeTokenName);
           }
        };
        GET_Asset_inner.onError = ^(NSString *reason, NSInteger code) {
        
        };
        GET_Asset_inner.onEndConnection = ^{
            
        };
        [GET_Asset_inner sendRequestWithAddress:addr];
    };
}
- (IBAction)confirmTap:(id)sender {
    BOOL isVaildEmail =  [QuickJudge isVaildEmail:self.addressTextView.textField.text] ;
    
    if(!isVaildEmail && ![QuickJudge isVaildAddrWithTokenId:@(self.assetTokenModel.tokenId).stringValue
                                       addr:self.addressTextView.textField.text] ) {
        [QMUITips showError:@"请输入正确的地址"];
        return;
    }
    TPTransView *transView = [TPTransView createTransferViewStyle:TPTransStyleTransfer];
    transView.title = Localized(@"Confirm Payment Password");
    transView.desc = Localized(@"Transfer amount");
    NSDecimalNumber *total = [[NSDecimalNumber alloc]initWithString:self.totalNumberTextView.textField.text];
    transView.Total = TPString(@"%.4f %@",yufloat_token(total.doubleValue) ,self.assetTokenModel.tokenName);
    transView.con1 = self.addressTextView.textField.text;
    CGFloat fee = self.isInnerUserAddr ?0.0:self.transferBaseInfo.fee;
    transView.con2 = TPString(@"%.6f %@",  yufloat_fee(fee),self.transferBaseInfo.feeTokenName);
    [transView showMenuWithAlpha:YES];
    transView.pvc = self;
    __block TPTransView *TPTransV = transView;
    yudef_weakSelf
    [transView.pasView setEndEditBlock:^(NSString *text)
     {
         if (text.length == 6)
         {
             [QMUITips showLoadingInView:weakSelf.view hideAfterDelay:5.0];
             API_POST_Asset_Transaction *POST_Asset_Transaction = [[API_POST_Asset_Transaction alloc] init];
             POST_Asset_Transaction.onSuccess = ^(id responseData) {
                 [QMUITips showSucceed:@"转账成功！"];
                 [weakSelf.navigationController popViewControllerAnimated:YES];
             };
             POST_Asset_Transaction.onError = ^(NSString *reason, NSInteger code) {
                 [QMUITips showError:@"交易密码或地址错误！"];
             };
             POST_Asset_Transaction.onEndConnection = ^{
                 [TPTransV showMenuWithAlpha:NO];
                 [QMUITips hideAllTipsInView:weakSelf.view];
             };
             NSString *addr = weakSelf.addressTextView.text;
             NSString *pwd = text;
             NSInteger tokenId = weakSelf.assetTokenModel.tokenId;
             CGFloat value = [weakSelf.totalNumberTextView.text doubleValue];
             [POST_Asset_Transaction sendRequestWithAddress:addr
                                                   password:pwd
                                                    tokenId:tokenId
                                                      value:value];
         }
     }];
}
#pragma mark - <lazy load>

- (NSString *)defaultAddress {
    if (!_defaultAddress) {
        _defaultAddress = @"";
    }
    return _defaultAddress;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
