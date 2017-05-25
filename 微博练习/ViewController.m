//
//  ViewController.m
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "WebUtils.h"
#import "Account.h"
#import "LoginViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
  
    
    
    
    
}
- (IBAction)sendAction:(id)sender {
    
    if ([Account shareAccount]) {
        
        [WebUtils sendText:self.myTF.text andCompletion:^(id obj) {
           
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"发送成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [ac addAction:action1];
            [self presentViewController:ac animated:YES completion:nil];
            
        }];
        
        
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
   
    
    if ([Account shareAccount]) {
        self.title = @"已登录";
    }else self.title = @"未登录";
    
}
- (IBAction)loginAction:(UIButton *)sender {
    
    if (sender.tag==0) {
        
        if (![Account shareAccount]) {
            LoginViewController *vc = [LoginViewController new];
            
            [self presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
        }
        
        
    }else{//退出登录
        
        [[Account shareAccount]logout];
        
        self.title = @"请登录";
        
    }
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
