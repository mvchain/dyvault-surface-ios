//
//  NIMScannerViewController.m
//  NIMKit
//
//  Created by FengKun on 2018/3/7.
//  Copyright © 2018年 NetEase. All rights reserved.
//

#import "NIMScannerViewController.h"
#import "NIMScannerBorder.h"
#import "NIMScannerMaskView.h"
#import "NIMScanner.h"
#import "UIViewExt.h"
//#import "NIMGlobalMacro.h"
//#import "UIView+NIM.h"
//#import "UIViewController+BackButtonHandler.h"
/// 控件间距
#define kControlMargin  72.0
/// 相册图片最大尺寸
#define kImageMaxSize   CGSizeMake(1000, 1000)

static NSString * typeID = @"evn:f:";
static NSString * typeGroupID = @"evn:g:";
static NSString * typeRoomID = @"evn:r:";

@interface NIMScannerViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
/// 名片字符串
@property (nonatomic) NSString *cardName;
/// 头像图片
@property (nonatomic) UIImage *avatar;
/// 完成回调
@property (nonatomic, copy) void (^completionCallBack)(NSString * );


@end

@implementation NIMScannerViewController {
    /// 扫描框
    NIMScannerBorder *scannerBorder;
    /// 扫描器
    NIMScanner *scanner;
    /// 提示标签
    UILabel *tipLabel;
}

- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *))completion
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.cardName = cardName;
        self.avatar = avatar;
        self.completionCallBack = completion;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    
    // 实例化扫描器
    __weak typeof(self) weakSelf = self;
    __weak typeof (scannerBorder) wscanner = scannerBorder;
    
    scanner = [NIMScanner scanerWithView:self.view scanFrame:scannerBorder.frame completion:^(NSString *stringValue)
               {
                   if( [weakSelf selectNTESType:stringValue] ){
                       [weakSelf clickCloseButton];
                   }else{
                       [weakSelf startScan];
                   }
               }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [scannerBorder startScannerAnimating];
    [scanner startScan];
}
- (void)startScan {
    [scannerBorder startScannerAnimating];
    [scanner startScan];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [scannerBorder stopScannerAnimating];
    [scanner stopScan];
}

#pragma mark - 监听方法
/// 点击关闭按钮
- (void)clickCloseButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        //process image
        
        [picker dismissViewControllerAnimated:YES completion:^{
            [NIMScanner scaneImage:image completion:^(NSArray *values) {
                NSLog(@"values.firstObject:%@",values.firstObject);
                if (values.count > 0)
                {
                    [self selectNTESType:values.firstObject];
                    
                    [self dismissViewControllerAnimated:NO completion:^{
                        [self clickCloseButton];
                    }];
                } else {
                    self->tipLabel.text = @"";
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
        }];
        
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
/// 点击相册按钮
- (void)clickAlbumButton
{
    
    UIImagePickerController *pickerCtr = [[UIImagePickerController alloc] init];
    pickerCtr.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerCtr.delegate = self;
    [self presentViewController:pickerCtr animated:YES completion:nil];
    
    
    
}


#pragma mark - UIImagePickerControllerDelegate


- (UIImage *)resizeImage:(UIImage *)image {
    
    if (image.size.width < kImageMaxSize.width && image.size.height < kImageMaxSize.height) {
        return image;
    }
    
    CGFloat xScale = kImageMaxSize.width / image.size.width;
    CGFloat yScale = kImageMaxSize.height / image.size.height;
    CGFloat scale = MIN(xScale, yScale);
    CGSize size = CGSizeMake(image.size.width * scale, image.size.height * scale);
    
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

-(BOOL)selectNTESType:(NSString *)stringValue
{
    
    if( ![QuickJudge isVaildAddrWithTokenId:self.tokenid addr:stringValue] ) {
        
        
        [QMUITips showError:@"Error address"];
        
        return NO ;
        
    }
    
    NSString *typeStr = [stringValue substringToIndex:6];
    NSString *conStr = [stringValue substringFromIndex:6];
    
    
    if ([typeStr isEqualToString:typeID])
    {
        // 完成回调
        self.completionCallBack(conStr);
    }
    else if ([typeStr isEqualToString:typeGroupID])
    {
        self.completionCallBack(conStr);
    }
    else if ([typeStr isEqualToString:typeRoomID])
    {
        self.completionCallBack(conStr);
    }
    else
    {
        self.completionCallBack(stringValue);
    }
    return YES;
    
}

#pragma mark - 设置界面
- (void)prepareUI
{
    [self prepareNavigationBar];
    [self prepareScanerBorder];
    [self prepareOtherControls];
}

/// 准备提示标签和名片按钮
- (void)prepareOtherControls
{
    // 1> 提示标签
    tipLabel = [[UILabel alloc] init];
    tipLabel.text = Localized(@"Automatically scan the QR code by placing it in the viewfinder");
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = [UIColor qmui_colorWithHexString:@"#b1b1bc"];//NIMKit_UIColorFromRGB(0xb1b1bc);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [tipLabel sizeToFit];
    tipLabel.centerX = scannerBorder.centerX;
    tipLabel.top = scannerBorder.bottom + 12;
    [self.view addSubview:tipLabel];
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.view addSubview:bottomView];
    bottomView.bottom = self.view.bottom - 62 - HOME_INDICATOR_HEIGHT;
    bottomView.width = self.view.width;
    bottomView.left = 0;
    bottomView.height = 62 + HOME_INDICATOR_HEIGHT;
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [photoBtn setTitle:Localized(@"Choose from album") forState:UIControlStateNormal];
    [photoBtn setImage:[UIImage imageNamed:@"pohoto_icon"] forState:UIControlStateNormal];
    [photoBtn setTitleColor:[UIColor qmui_colorWithHexString:@"#AAAAAA"] forState:UIControlStateNormal];
    [photoBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    photoBtn.titleLabel.font = FONT(15);
    [photoBtn addTarget:self action:@selector(clickAlbumButton) forControlEvents:UIControlEventTouchUpInside];
    //    [photoBtn setLayer:23 WithBackColor:[UIColor colorWithHex:@"#5E5E60"]] ;
    [bottomView addSubview:photoBtn];
    CGFloat pW = 147;
    photoBtn.left = bottomView.width/2 - pW/2;
    photoBtn.top = 62/2 - 44/2;
    photoBtn.size = CGSizeMake(pW, 44);
}

/// 准备扫描框
- (void)prepareScanerBorder
{
    CGFloat width = self.view.bounds.size.width - 135;
    scannerBorder = [[NIMScannerBorder alloc] initWithFrame:CGRectMake(0, 124 + StatusBarHeight, width, width)];
    scannerBorder.centerX = self.view.centerX;
    scannerBorder.tintColor = self.navigationController.navigationBar.tintColor;
    [self.view addSubview:scannerBorder];
    NIMScannerMaskView *maskView = [NIMScannerMaskView maskViewWithFrame:self.view.bounds cropRect:CGRectMake(scannerBorder.left + 2, scannerBorder.top + 2, scannerBorder.width - 4, scannerBorder.height -4)];
    [self.view insertSubview:maskView atIndex:0];
}

/// 准备导航栏
- (void)prepareNavigationBar
{
    [self addNormalNavBar:Localized(@"Scan code transfer")];
    [self.normalNavbar setLeftButtonAsReturnButton];
    [self.normalNavbar setLeftButtonWithImage:UIImageMake(@"cancel") withSize:CGSizeMake(13, 13)];
    
    __weak typeof (self) wsf = self;
    self.normalNavbar.leftButton.onClick = ^(id sender) {
        [wsf.navigationController popViewControllerAnimated:YES];
        [wsf dismissViewControllerAnimated:YES completion:^{
        }];
    };
}

- (BOOL)navigationShouldPopOnBackButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    return NO;
}
@end
