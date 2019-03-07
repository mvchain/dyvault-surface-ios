#import <UIKit/UIKit.h>

@interface TransactionHeadInfoModel : NSObject

@property (nonatomic, assign) CGFloat balance;
@property (nonatomic, assign) CGFloat fee;
@property (nonatomic, strong) NSString * feeTokenName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
