//
//  YUPhoneInformationTools.h
//  Forum
//
//  Created by yxyyxy on 29/03/2018.
//  Copyright © 2018 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YUPhoneInformationTools : NSObject
+ (BOOL)isIphoneX;

+ (CGFloat)navBarBottom ;

+ (CGFloat)tabBarHeight ;

+ (CGFloat)screenWidth ;

+ (CGFloat)screenHeight;

+ (CGRect )llnavButtonFrame;

+ (CGRect)rrnavButtonFrame;

+ (CGSize)getSpaceLabelHeight:(NSString*)str
                     withFont:(UIFont*)font
                    withWidth:(CGFloat)width
                    lineSpace:(CGFloat) lineSpace
                   max_height:(CGFloat)maxheight;

+ (void)isMessageNotificationServiceOpen:(void(^)(BOOL isopen ))isopen ;
+ (BOOL)isFirstUseApp ;
@end
