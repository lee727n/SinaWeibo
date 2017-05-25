//
//  Comment.h
//  微博登录
//
//  Created by tarena on 16/10/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "User.h"
@interface Comment : JSONModel{
    float _commentHeight;
}
@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *created_at;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, strong)User *user;

- (float)commentHeight;
@end
