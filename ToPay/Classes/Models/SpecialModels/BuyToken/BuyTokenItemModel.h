//
//    BuyTokenItemModel.h
//
//    Create by 蒲公英 on 8/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyTokenItemModel : NSObject

@property (nonatomic, strong) NSString * channelName;
@property (nonatomic, strong) NSString * contact;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, assign) NSInteger updatedAt;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
