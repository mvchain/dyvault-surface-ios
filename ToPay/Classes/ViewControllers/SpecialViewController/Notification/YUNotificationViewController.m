//
//  YUNotificationViewController.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/4.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUNotificationViewController.h"
#import "YUNotificationItemEntity.h"
@interface YUNotificationViewController ()
@property (weak, nonatomic) IBOutlet YUPageListView *pageListView;
@end
@implementation YUNotificationViewController
#pragma mark - <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - <public method>
- (void)initSubviews {
    [super initSubviews];
    [self setNav];
}

#pragma mark - <private method>
- (void)setNav {
    [self addNormalNavBar:@"通知"];
    [self.normalNavbar setLeftButtonAsReturnButton];
}

- (void)configPageListView {
    self.pageListView.firstPageBlock = ^(block_complete  _Nonnull complete)
    {
        
    };
}
- (void)setData {
    
}
#pragma mark - <event response>

#pragma mark - <lazy load>

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
