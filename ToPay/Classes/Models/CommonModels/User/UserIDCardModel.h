//
//	UserIDCardModel.h
//
//	Create by 蒲公英 on 28/2/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserIDCardModel : NSObject<NSCoding>

@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * refreshToken;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString * salt;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
