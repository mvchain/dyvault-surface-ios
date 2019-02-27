//
//  YUSlideButtonsGroup.h
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YUDIVView;

@interface YUSlideButtonsGroup : UIScrollView


// 状态按钮的容器
@property (strong,nonatomic) YUDIVView * selectButtonListView;

// 状态按钮array
@property (strong,nonatomic) NSMutableArray * statusButtons;

@property (copy, nonatomic) void (^groupBtnOnClick)(id ,int  );


@property (weak,nonatomic) UIView * curSelectedView;

- (void)setTitles:(NSArray *) arr buttonEw:(CGFloat) ew;

- (void)alignCenter;

- (void)testMode;


@end
