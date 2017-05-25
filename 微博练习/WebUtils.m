//
//  WebUtils.m
//  菜谱App
//
//  Created by tarena on 2017/2/18.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "Account.h"
#import "WebUtils.h"
#import "AFNetworking.h"
@implementation WebUtils

+(void)requestTokenWithCode:(NSString *)code andCompletion:(MyCallback)callback{
    
    //通过AFNetworking发出http请求
    NSString *path = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *parmas = @{@"client_id":@"515845254",@"client_secret":@"a78532b0e6a29212b67eb44071416890",@"grant_type":@"authorization_code",@"code":code,@"redirect_uri":@"http://www.baidu.com"};
    
    //创建会话管理器
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置响应序列化
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    //发出GET 或POST请求
    [manager POST:path parameters:parmas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        
        //如果返回的数据为json字符串 使用以下代码
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];

}
+ (void)sendText:(NSString *)text andCompletion:(MyCallback)callback{
    
    //通过AFNetworking发出http请求
    NSString *path = @"https://api.weibo.com/2/statuses/update.json";
    NSDictionary *parmas = @{@"access_token":[Account shareAccount].token,@"status":text};
    
    //创建会话管理器
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置响应序列化
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    //发出GET 或POST请求
    [manager POST:path parameters:parmas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        
        //如果返回的数据为json字符串 使用以下代码
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
}

@end
