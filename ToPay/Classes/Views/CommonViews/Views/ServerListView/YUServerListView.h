//
//  YUServerListView.h
//  ToPay
//
//  Created by 蒲公英 on 2019/2/27.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YUServerListView : UIView
@property (strong,nonatomic) void(^yu_didSelectRowAtIndexPath)(NSIndexPath *indexPath);

// set http data from server
@property (strong,nonatomic) NSMutableArray<YUCellEntity*> *(^yu_httpDataDecoding)(NSDictionary *httpResponseDict);
// for firstpage and next page ,
@property (copy,nonatomic) NSString *parameterIDKey;
// list server http
@property (copy,nonatomic) NSString *httpPath;
// do not write parameterID and it's value which is for nextpage
@property (strong,nonatomic) NSDictionary *extraRequestDict ;

@property (assign,nonatomic) HTTPMethod httpRequstType;

@end

NS_ASSUME_NONNULL_END
