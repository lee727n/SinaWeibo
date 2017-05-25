//
//  Account.h
//  微博练习
//
//  Created by tarena on 2017/2/20.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject
@property (nonatomic, copy)NSString *token;
@property (nonatomic, copy)NSString *uid;
+ (Account *)shareAccount;

- (void)logout;
@end
