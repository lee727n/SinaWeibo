//
//  Weibo.h
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "User.h"
#import "JSONModel.h"

@interface Weibo : JSONModel
@property (nonatomic, copy)NSString *created_at;
@property (nonatomic, copy)NSString *idstr;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, strong)NSArray<Optional> *pic_urls;
@property (nonatomic, strong)User *user;
@property (nonatomic, copy)NSString *reposts_count;
@property (nonatomic, copy)NSString *comments_count;
@property (nonatomic, copy)NSString *attitudes_count;
@property (nonatomic, copy)NSString *source;

//转发微博
@property (nonatomic, strong)Weibo<Optional> *retweeted_status;



@end
