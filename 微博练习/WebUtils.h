//
//  WebUtils.h
//  菜谱App
//
//  Created by tarena on 2017/2/18.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);

@interface WebUtils : NSObject


+ (void)requestTokenWithCode:(NSString *)code andCompletion:(MyCallback)callback;


+ (void)sendText:(NSString *)text andCompletion:(MyCallback)callback;



@end
