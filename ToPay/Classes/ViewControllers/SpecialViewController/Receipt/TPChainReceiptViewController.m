//
//  TPChainReceiptViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2018/11/20.
//  Copyright © 2018年 蒲公英. All rights reserved.
//

#import "TPChainReceiptViewController.h"
#import "TPUserInfo.h"
#import "NIMScanner.h"
#import "YFactoryUI.h"
#import "UIViewExt.h"
#import "API_GET_Asset_Address.h"
#import <Social/Social.h>
@interface TPChainReceiptViewController ()
@property (nonatomic, strong) UIImageView * iconImgV;
@property (nonatomic, strong) UIButton * addressBtn;
@property (nonatomic, strong) UILabel *descLab;
@property (nonatomic, strong) UIImageView * QRView;
@property (nonatomic, strong) UIButton *cpBtn;

@end

@implementation TPChainReceiptViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *navAddr = TPString(@"%@ %@",self.assetModel.tokenName,Localized(@"Receipt"));
    [self addNormalNavBar:navAddr];
    [self.normalNavbar setRightButtonWithImage:UIImageMake(@"share_icon_black")
                                      withSize:CGSizeMake(44, 44) withRight: 1 withBottom:0];
    [self.normalNavbar setLeftButtonAsReturnButton];
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wsf = self;
    self.normalNavbar.rightButton.onClick = ^(id sender ) {
        UIImage *shot = [QuickGet makeImageWithView:wsf.view withSize:wsf.view.bounds.size];
        UIImage *imageToShare = shot;
        NSArray *items = @[imageToShare];
        [QuickDo shareToSystem:items target:wsf  success:^(bool isok) {
            
        }];
    };
    [self createUI];
    [self.iconImgV setImage:UIImageMake(@"head")];
    [self setUpQRimgView];
}

-(void)setUpQRimgView
{
    API_GET_Asset_Address *GET_Asset_Address = [[API_GET_Asset_Address alloc] init];
    [QMUITips showLoadingInView:self.view];
    GET_Asset_Address.onSuccess = ^(id responseData) {
        NSString *address = (NSString *)responseData ;
        [self.addressBtn setTitle:address forState:UIControlStateNormal];
        [NIMScanner qrImageWithString:address avatar:nil completion:^(UIImage *image)
        {
                          self.QRView.image = image;
        }];
    };
    GET_Asset_Address.onError = ^(NSString *reason, NSInteger code) {
        [QMUITips showError:reason];
    };
    GET_Asset_Address.onEndConnection = ^{
        [QMUITips hideAllTipsInView:self.view];
    };
    [GET_Asset_Address sendRequestWithTokenId:self.assetModel.tokenId];

}


-(void)createUI
{
    UIView *backView = [[UIView alloc] init];
    [backView setLayer:16 WithBackColor:[UIColor whiteColor]];
    [backView setBackgroundColor:[UIColor qmui_colorWithHexString:@"#F5F5F5" ] ];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@(119 + STATUS_BAR_HEIGHT));
        make.width.equalTo(@335);
        make.height.equalTo(@392);
    }];
    
    UIImageView *iconImgV = [YFactoryUI YImageViewWithimage:nil];
    self.iconImgV = iconImgV;
    [self.view addSubview:iconImgV];
    [iconImgV mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerX.equalTo(backView);
        make.centerY.equalTo(backView.mas_top);
        make.size.equalTo(@56);
    }];
    
    UILabel *descLab = [YFactoryUI YLableWithText:TPString(@"%@ %@",self.assetModel.tokenName,Localized(@"Receipt address")) color:TP59Color font:FONT(14)];
    self.descLab = descLab;
    [self.view addSubview:descLab];
    [descLab mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerX.equalTo(backView);
        make.top.equalTo(iconImgV.mas_bottom).with.offset(13);
        make.height.equalTo(@19);
    }];
    
    UIButton *addressBtn = [YFactoryUI YButtonWithTitle:@"..." Titcolor:TP8EColor font:FONT(13) Image:nil target:self action:@selector(copyClick)];
    //[YFactoryUI YLableWithText:@"0x2051dd2b...a196ccc2448" color:TP8EColor font:FONT(13)];
    self.addressBtn = addressBtn;
    [self.view addSubview:addressBtn];
    
    [addressBtn mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(backView);
         make.top.equalTo(descLab.mas_bottom).with.offset(6);
         make.height.equalTo(@19);
         make.width.equalTo(@153);
     }];
    UIButton *copyBtn = [YFactoryUI YButtonWithTitle:@"" Titcolor:nil font:nil Image:[UIImage imageNamed:@"copy_icon"] target:self action:@selector(copyClick)];
    self.cpBtn = copyBtn;
    [self.view addSubview:copyBtn];
    [copyBtn mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(addressBtn.mas_right).with.offset(6);
        make.size.equalTo(@15);
        make.centerY.equalTo(addressBtn);
    }];
    
    UIImageView *QRView = [YFactoryUI YImageViewWithimage:nil];
    self.QRView = QRView;
    QRView.backgroundColor = [UIColor whiteColor];;
    [self.view addSubview:QRView];
   
    [QRView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(backView);
         make.top.equalTo(addressBtn.mas_bottom).with.offset(19);
         make.size.equalTo(@245);
     }];
    
    UIImageView *logoImgV = [YFactoryUI YImageViewWithimage:nil];

}

-(void)copyClick
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.addressBtn.titleLabel.text;
    [QMUITips showSucceed:Localized(@"Copied")];
    
}

@end
