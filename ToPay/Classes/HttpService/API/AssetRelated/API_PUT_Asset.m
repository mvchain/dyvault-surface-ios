//
//  API_PUT_Asset.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/5.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "API_PUT_Asset.h"

@implementation API_PUT_Asset
- (void)sendRequestWithAddTokenIdArr:(NSString *)addTokenIdArr
                    removeTokenIdArr:(NSString *)removeTokenIdArr {
    self.apiPath = @"/asset";
    self.requestDict[@"addTokenIdArr"] = addTokenIdArr;
    self.requestDict[@"removeTokenIdArr"] = removeTokenIdArr;
    [self connectWithRquestMethod:HTTPMethodPUT];
    
}
@end
