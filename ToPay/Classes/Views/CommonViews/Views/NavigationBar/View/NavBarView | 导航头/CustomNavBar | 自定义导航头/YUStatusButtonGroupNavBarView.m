//
//  YUStatusButtonGroupNavBarView.m
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUStatusButtonGroupNavBarView.h"
#import "YUHamburgerButton.h"
#import "YUPhoneInformationTools.h"
#import "YUDIVView.h"

#import "UIView+YUStyle.h"
#import "YUUnderlineButton.h"
#import "YUSlideButtonsGroup.h"

static const CGFloat kGroupButtonWidth = 69 ;

@implementation YUStatusButtonGroupNavBarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    return self;
}

-(void)setTitles:(NSArray *) arr{
  //  CGFloat ew = [self y_Width] / (CGFloat)arr.count;
    [_slideButtonGroupView setTitles:arr buttonEw:kGroupButtonWidth];
    [_slideButtonGroupView alignCenter];
}
- (void)setUp{
    
    _slideButtonGroupView =[[YUSlideButtonsGroup alloc]initWithFrame:CGRectMake(0, 0, [YUPhoneInformationTools screenWidth], [YUPhoneInformationTools navBarBottom])];
    [_slideButtonGroupView setBackgroundColor:self.backgroundColor];
    
    
    [self addSubview:_slideButtonGroupView];
    self.backgroundColor= [UIColor whiteColor];
   
}
@end
