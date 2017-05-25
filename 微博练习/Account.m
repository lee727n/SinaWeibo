//
//  Account.m
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "Account.h"
static Account *_account;
@implementation Account
+(Account *)shareAccount{
    
    if (!_account) {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.plist"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        if (dic) {
            _account = [Account new];
            _account.token = dic[@"access_token"];
            _account.uid = dic[@"uid"];
        }
     }
    return _account;
}
-(void)logout{
    
     NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.plist"];
    [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
    
    _account = nil;
    
}
@end
