//
//  YUSlideButtonsGroup.m
//  Forum
//
//  Created by yxyyxy on 30/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import "YUSlideButtonsGroup.h"
#import "UIView+YUStyle.h"
#import "YUDIVView.h"
#import "YUHamburgerButton.h"
#import "YUUnderlineButton.h"
#import "YUPhoneInformationTools.h"

static const int kTag= 100;


@implementation YUSlideButtonsGroup
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        // 与本页面宽度相同
        _selectButtonListView = [[YUDIVView alloc]initWithFrame:CGRectMake(0, 0, [self y_Width], [self y_Height])];
        
        [self addSubview:_selectButtonListView];
        _statusButtons = [[NSMutableArray alloc]init];
        
    }
    return self;
    
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    
    [super setBackgroundColor:backgroundColor];
    [_selectButtonListView setBackgroundColor:backgroundColor];
    
}

- (void)setTitles:(NSArray *) arr buttonEw:(CGFloat) ew{
    
    NSArray * color = @[[UIColor redColor],[UIColor blackColor]];
    [self removeAllStatusButton];
    _statusButtons = [[NSMutableArray alloc]init];
    [_selectButtonListView setFrame:self.bounds];
    for(int i = 0 ; i < arr.count; i++){
        NSString * title = arr[i];
        YUHamburgerButton * statusButton = [self buttonWithTitle:title buttonEw:ew];
        [statusButton setTag:kTag+i];
        
        [statusButton setBackgroundColor:self.backgroundColor];
        [_statusButtons addObject:statusButton];
    }
    [_selectButtonListView setViews:_statusButtons marginRight:20 marginTop:0 paddingLeft:10];
    [_selectButtonListView autoWidth];
    
    [self setStatusButtonEvent];
    [self defaultStatus];
}

- (void)defaultStatus{
    [self allUnSelectedStatus];
    YUHamburgerButton * firstBtn =  _statusButtons.firstObject;
    [((YUUnderlineButton * )(firstBtn.midView)) selectedStatus];
    _curSelectedView= firstBtn;
}

-(void)allUnSelectedStatus{
    
    for(YUHamburgerButton * v in _statusButtons){
        YUUnderlineButton *underLineView =(YUUnderlineButton *)v.midView;
        [underLineView unSelectedStatus];
        
    }
}

- (YUHamburgerButton *)buttonWithTitle:(NSString * )title buttonEw:(CGFloat)ew {
    
    YUUnderlineButton * underLineButton = [YUUnderlineButton defaultUnderlineButton];
    [underLineButton setTitle:title];
    YUHamburgerButton * statusButton = [[YUHamburgerButton alloc]initWithFrame:CGRectMake(0, 0, ew, 50)];
    
    [statusButton setMidView:underLineButton];
    [underLineButton y_setAlign:5];
    return statusButton;
}

-(void)setStatusButtonEvent{
    __weak typeof (self) weakSelf= self;
    for(YUHamburgerButton * v in _statusButtons){
        __weak typeof (v) weakV = v;
        v.onClick = ^(id sender) {
            
            YUUnderlineButton * newUnderLineView = (YUUnderlineButton *)weakV.midView;
            YUUnderlineButton * oldUnderLineView = (YUUnderlineButton *)((YUHamburgerButton *)weakSelf.curSelectedView).midView;
            [weakSelf moveFrameA:oldUnderLineView toFrameB:newUnderLineView];
            [oldUnderLineView unSelectedStatus];
            [newUnderLineView selectedStatus];
            weakSelf.curSelectedView=sender;
            int tag = (int) ( weakSelf.curSelectedView.tag-kTag ) ;
            
            if(_groupBtnOnClick){
                // 事件传递
                _groupBtnOnClick(sender,tag);
            }
        };
    }
}

- (void)moveFrameA:(YUUnderlineButton *)a toFrameB:(YUUnderlineButton *) b{
    
    CGRect aRect = [a convertRect:a.lineView.frame toView:self.window];
    CGRect bRect = [b convertRect:b.lineView.frame toView:self.window];
    UIView * tmpLine = [[UIView alloc] initWithFrame:aRect];
    UIColor * co = [UIColor colorWithRed:76/255.0 green:100/255.0 blue:253/255.0 alpha:1];
    
    
    [tmpLine setBackgroundColor:co];
    [self.window addSubview:tmpLine];
    [UIView animateWithDuration:0.3 animations:^{
        [tmpLine setFrame:bRect];
        
    } completion:^(BOOL finished) {
        [tmpLine removeFromSuperview];
        
    }];
}

- (void)removeAllStatusButton{
    
    for(YUHamburgerButton * v in _statusButtons){
        [v removeFromSuperview];
    }
    
}
- (void)testMode{
    
    NSArray * arr = @[ [UIColor blueColor],[UIColor redColor]  ];
    _selectButtonListView.backgroundColor = [UIColor greenColor];
    self.backgroundColor = [UIColor greenColor];
    int i = 0 ;
    for(YUHamburgerButton * ham in _statusButtons){
        [ham setBackgroundColor:arr[i%2]];
        i++;
    }
    
}
- (void)alignCenter{
    
    [_selectButtonListView y_setAlign:5];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
