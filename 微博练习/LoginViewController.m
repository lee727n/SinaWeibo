//
//  LoginViewController.m
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "WebUtils.h"
@interface LoginViewController ()<UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    UIWebView *webView= [[ UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=515845254&redirect_uri=http://www.baidu.com"]]];
    
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backAction)];
}

- (void)backAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    NSLog(@"%@",request.URL);
    NSString *path = [request.URL description];
    //判断是否包含code
    if ([path containsString:@"code"]) {
        
        NSString *code = [[path componentsSeparatedByString:@"="]lastObject];
        
        NSLog(@"%@",code);
        //通过code 换 token
        
        [WebUtils requestTokenWithCode:code andCompletion:^(id obj) {
            NSDictionary *dic = obj;
            
            NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.plist"];
            //把登录成功的信息保存到本地
            [dic writeToFile:path atomically:YES];
            //登录成功后返回页面
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        
        
        return NO;
    }
    
    //通过返回值控制 是否允许访问
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
