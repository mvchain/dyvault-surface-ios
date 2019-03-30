//
//  testVC.m
//  ToPay
//
//  Created by 蒲公英 on 2019/3/30.
//  Copyright © 2019年 MVC. All rights reserved.
//

#import "testVC.h"
#import "AdminInfo.h"

@interface testVC ()<UIWebViewDelegate>
@property (strong,nonatomic) UIWebView *webView;
@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame)))];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    
    
    [_webView loadRequest:[NSURLRequest  requestWithURL:[NSURL URLWithString:@"http://47.110.144.216/m-topay/#/"]]];
    // Do any additional setup after loading the view.
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSString *js = @"window.mvc = {};mvc.getAdmin = function (){ alert(1)};";
    [webView stringByEvaluatingJavaScriptFromString:js];
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
- (NSString *)jsReturnMethodByAdminInfo:(AdminInfo *)adminInfo {
    NSDictionary *dict = [adminInfo toDictionary];
    NSString *json_res = [self dictionaryToJson:dict];
    NSString *js = @"window.mvc = {};mvc.getAdmin = function (){ return #};";
    return  [js stringByReplacingOccurrencesOfString:@"#" withString:json_res];
}

@end
