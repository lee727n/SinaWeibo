//
//  User.m
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "User.h"

@implementation User
+(JSONKeyMapper *)keyMapper{
    
   
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"uid":@"id",@"intro":@"description"}];
}
@end
