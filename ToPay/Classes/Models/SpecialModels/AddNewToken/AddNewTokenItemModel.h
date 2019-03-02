//
//	AddNewTokenItemModel.h
//
//	Create by 蒲公英 on 1/3/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewTokenItemModel : NSObject

@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, strong) NSString * tokenCnName;
@property (nonatomic, strong) NSString * tokenEnName;
@property (nonatomic, assign) NSInteger tokenId;
@property (nonatomic, strong) NSString * tokenImage;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) NSInteger tokenType;
@property (nonatomic, assign) NSInteger visible;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
