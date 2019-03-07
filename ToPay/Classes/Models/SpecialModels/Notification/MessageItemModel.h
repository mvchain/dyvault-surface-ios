//
//    MessageItemModel.h
//
//    Create by 蒲公英 on 7/3/2019
//    Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageItemModel : NSObject

@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) NSInteger messageId;
@property (nonatomic, strong) NSString * messageType;
@property (nonatomic, assign) NSInteger read;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger updatedAt;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
