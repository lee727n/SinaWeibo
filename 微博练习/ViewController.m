//
//  ViewController.m
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "LoginViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
  
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.plist"];
    NSDictionary *loginDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (loginDic) {
        self.title = @"已登录";
    }else self.title = @"未登录";
    
}
- (IBAction)loginAction:(id)sender {
    LoginViewController *vc = [LoginViewController new];
    
    [self presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
