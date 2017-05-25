//
//  User.h
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

@property (nonatomic, copy)NSString *screen_name;
@property (nonatomic, copy)NSString *followers_count;
@property (nonatomic, copy)NSString *friends_count;
@property (nonatomic, copy)NSString *location;
@property (nonatomic, strong)NSURL *avatar_large;
@property (nonatomic, strong)NSURL<Optional> *cover_image_phone;

@property (nonatomic, copy)NSString *uid;
@property (nonatomic, copy)NSString *intro;

//Optional 可选
@property (nonatomic, copy)NSString<Optional> *abc;


@end
