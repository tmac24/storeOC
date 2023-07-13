//
//  DCWebViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/20.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCWebViewController.h"
#import <WebKit/WebKit.h>

@interface DCWebViewController ()<WKScriptMessageHandler>

/** webview */
@property (nonatomic, strong) WKWebView *webView;
/** config */
@property (nonatomic, strong) WKWebViewConfiguration *config;

@end

@implementation DCWebViewController

#pragma mark - LazyLoad
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:self.config];
    }
    return _webView;
}

- (WKWebViewConfiguration *)config {
    if (!_config) {
        _config = [[WKWebViewConfiguration alloc] init];
    }
    return _config;
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    [self setUpData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.webView.configuration.userContentController addScriptMessageHandler:self name:@"gotoActive"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"gotoActive"];
}

#pragma mark - initialize
- (void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
}

- (void)setUpData {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"WKWeb.html" ofType:nil];
//    NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [self.webView loadHTMLString:htmlString baseURL:nil];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
    
    //OC调用JS代码如下:
//    NSString *jsString = [NSString stringWithFormat:@"changeColor('%@')", @"Js参数"];
//    [_webView evaluateJavaScript:jsString completionHandler:^(id _Nullable data, NSError * _Nullable error) {
//        NSLog(@"改变HTML的背景色");
//    }];
}

#pragma mark - WKScriptMessageHandler
//用message.body获得JS传出的参数体
- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
    NSDictionary *parameter = message.body;
    //JS调用OC
    if([message.name isEqualToString:@"jsToOcNoPrams"]){
      // 弹窗  等
    }else if([message.name isEqualToString:@"jsToOcWithPrams"]){
        
    }
}






@end
