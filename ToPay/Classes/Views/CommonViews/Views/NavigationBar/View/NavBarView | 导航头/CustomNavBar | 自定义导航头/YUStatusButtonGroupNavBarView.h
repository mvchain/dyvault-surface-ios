//
//  YUStatusButtonGroupNavBarView.h
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUCustomNavBarView.h"
@class YUDIVView;
@class YUSlideButtonsGroup;

@interface YUStatusButtonGroupNavBarView : YUCustomNavBarView

@property (strong ,nonatomic) YUSlideButtonsGroup * slideButtonGroupView;

- (void)setUp;

-(void)setTitles:(NSArray *) arr;


@end
