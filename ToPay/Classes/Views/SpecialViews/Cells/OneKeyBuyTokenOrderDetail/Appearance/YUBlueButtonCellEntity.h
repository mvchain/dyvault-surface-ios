//
//  YUBlueButtonCellEntity.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/30.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "YUCellEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface YUBlueButtonCellEntity : YUCellEntity
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL  isDisable;

@end

NS_ASSUME_NONNULL_END
