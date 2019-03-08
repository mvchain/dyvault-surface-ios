/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>
#define iPhoneX [QuickJudge is_iPhoneX]
#define HOME_INDICATOR_HEIGHT ([QuickJudge is_iPhoneX] ? 34.f : 0.f)
#define KHeight ([[UIScreen mainScreen] bounds].size.height)
#define TPMainColor [UIColor qmui_colorWithHexString:@"#007AFF"]
#define TP59Color [UIColor qmui_colorWithHexString:@"#595971"]
#define TP8EColor [UIColor qmui_colorWithHexString:@"#8E8E9E"]
#define TPF6Color [UIColor qmui_colorWithHexString:@"#F2F2F2"]
#define TPA7Color [UIColor qmui_colorWithHexString:@"#A7A9B8"]
#define TPD5Color [UIColor qmui_colorWithHexString:@"#D5D7E6"]
#define TPC1Color [UIColor qmui_colorWithHexString:@"#C1C2CC"]
#define TPEBColor [UIColor qmui_colorWithHexString:@"#EBF1FB"]
#define TPD5Color [UIColor qmui_colorWithHexString:@"#D5D7E6"]
#define TP5856D6 [UIColor qmui_colorWithHexString:@"#5856D6"]
#define FONT(F) [UIFont systemFontOfSize:F]
#define KWidth ([[UIScreen mainScreen] bounds].size.width)

// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 44.f : 44.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

//找到自己的vc
- (UIViewController *)y_viewController;
-(void)setLayerCornerRadius:(CGFloat)radius WithColor:(UIColor *)color WithBorderWidth:(CGFloat)width;
-(void)setLayer:(CGFloat)color WithBackColor:(UIColor *)backColor;
@end
