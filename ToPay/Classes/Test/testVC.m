//
//  testVC.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/30.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "testVC.h"
#import "AdminInfo.h"
#import "API_GET_Order.h"
#import "API_POST_Order.h"
@interface testVC ()<UIWebViewDelegate>
@property (strong,nonatomic) UIWebView *webView;
@property (strong,nonatomic) AdminInfo *adminInfo ;
@end

@implementation testVC
- (AdminInfo *)adminInfo {
    if (!_adminInfo) {
        _adminInfo = [[AdminInfo alloc] init];
    }
    return _adminInfo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame)))];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    API_POST_Order *creaetOrder = [[API_POST_Order alloc] init];
    yudef_weakSelf;
    creaetOrder.onSuccess = ^(id responseData) {
        weakSelf.adminInfo.refreshToken = @"";
        weakSelf.adminInfo.token = @"";
        weakSelf.adminInfo.order = [[Order alloc] initWithDictionary:responseData];
        [weakSelf.webView loadRequest:[NSURLRequest  requestWithURL:[NSURL URLWithString:@"http://47.110.144.216/m-topay/#/"]]];
    };
    creaetOrder.onError = ^(NSString *reason, NSInteger code) {
        
    };
    creaetOrder.onEndConnection = ^{
        
    };
    [ creaetOrder sendRequestWithCny:@10 uid:@"asdasd"];
    
    // Do any additional setup after loading the view.
}
#pragma mark webview

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSAssert(self.adminInfo, @"no adminInfo! ");
    NSString *oc_setToken_bridge = [self objc_setToken_bridge_JsMethod];
    NSString *js_method_getAdmin = [self getAdmin_jsMethodByAdminInfo:self.adminInfo];
    NSString *js_method_setToken = [self setToken_jsMethod];
    NSLog(@"%@",js_method_getAdmin);
    [webView stringByEvaluatingJavaScriptFromString:oc_setToken_bridge];
    [webView stringByEvaluatingJavaScriptFromString:js_method_getAdmin];
    [webView stringByEvaluatingJavaScriptFromString:js_method_setToken];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
#pragma mark util

- (NSString *)getAdmin_jsMethodByAdminInfo:(AdminInfo *)adminInfo {
    NSDictionary *dict = [adminInfo toDictionary];
    NSString *json_res = [self dictionaryToJson:dict];
    json_res =  [json_res stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    json_res = [json_res stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *js = @"window.mvc = {};mvc.getAdmin = function (){ alert(1) ;return \"#\"};";
    return  [js stringByReplacingOccurrencesOfString:@"#" withString:json_res];
}

- (NSString *)setToken_jsMethod {
    NSString *js = @"mvc.setToken = function (obj){ objc_setToken_bridge(obj)};";
    return js;
}

- (NSString *)objc_setToken_bridge_JsMethod {
    NSString *js = @"function objc_setToken_bridge(x){alert(33);alert(x)}";
    return js;
}

- ( void)setToken:(NSString *)token
          refreshToken:(NSString *)refreshToken {
    self.adminInfo.refreshToken = refreshToken;
    self.adminInfo.token = token;
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
