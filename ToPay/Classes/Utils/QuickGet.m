//
//  QuickGet.m
//  ToPay
//
//  Created by 蒲公英 on 2019/2/28.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "QuickGet.h"
#import <CommonCrypto/CommonDigest.h>
@implementation QuickGet
+ (NSString *) encryptPwd:(NSString *)pwd salt:(NSString *)m_salt {

    NSString *salt = m_salt;
    NSString *inMd5 = [self md5:pwd];
    NSString *finalMd5 = [[self md5:TPString(@"%@%@",salt,[inMd5 uppercaseString])] uppercaseString];
    return finalMd5;
}

+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

+ (NSString *)getBundleIdStr {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

+ (NSString *)getCurBuildVersion {
    //  CFBundleVersion
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Version;
}

+ (CGFloat)makeFloatNumber:(CGFloat) num tailNum:(int)tailNum {
    NSInteger sum = 10 ;
    while (--tailNum) {
        sum*=10;
    }
    NSInteger res_int =  (NSInteger)(num * sum);
    return res_int / (CGFloat)sum;
}

+ (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

+ (NSString *)timeWithTimeIntervalString:( NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)timeWithTimeInterval_allNumberStyleString:( NSInteger)time
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)timeWithFormat:(NSString *)formt time:(NSInteger)time  {
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formt];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+ (NSString *)makeCnDayHourMinuteSecWithTimeCuo:(long long )time {
    
    long long day = time / ( 24 * 60 * 60 );
    long long rest_sec = time % ( 24 * 60 * 60 ) ;
    long long hour = rest_sec / (60 * 60);
    rest_sec = rest_sec % (60 * 60);
    long long mintue =  rest_sec / 60;
    rest_sec = rest_sec % 60 ;
    NSString *res ;
    if( day > 0 ) {
        res = TPString(@"%lld天%lld小时%lld分钟%lld秒",day,hour,mintue,rest_sec);
    }else if( hour > 0  ) {
        res = TPString(@"%lld小时%lld分钟%lld秒",hour,mintue,rest_sec);
    }else if ( mintue >0  ) {
        res = TPString(@"%lld分钟%lld秒",mintue,rest_sec);
    }else {
        res = TPString(@"%lld秒",rest_sec);
    }
    return res;
}

+ (NSString *)getNowTimeTimestamp
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f",a];
    return timeString;
}

+ (UIImage*)getImageByColor:(UIColor*)color
{
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
