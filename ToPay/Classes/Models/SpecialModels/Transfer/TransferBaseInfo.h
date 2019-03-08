//
//    TransferBaseInfo.h
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransferBaseInfo : NSObject

@property (nonatomic, assign) CGFloat balance;
@property (nonatomic, assign) CGFloat fee;
@property (nonatomic, strong) NSString * feeTokenName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
