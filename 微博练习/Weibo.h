//
//  Weibo.h
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "User.h"
@interface Weibo : JSONModel

@property (nonatomic, copy)NSString *created_at;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, strong)User *user;
@property (nonatomic, strong)Weibo<Optional> *retweeted_status;
@property (nonatomic, strong)NSArray<Optional> *pic_urls;

@end
