//
//	AssetTokenItemModel.h
//
//	Create by 蒲公英 on 1/3/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetTokenItemModel : NSObject

@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) NSInteger tokenId;
@property (nonatomic, strong) NSString * tokenImage;
@property (nonatomic, strong) NSString * tokenName;
@property (nonatomic, assign) CGFloat value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
