//
//  WeiboView.h
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYTextView.h"
#import "WeiboImageView.h"
#import "Weibo.h"
@interface WeiboView : UIView
@property (nonatomic, strong)YYTextView *textView;
@property (nonatomic, strong)WeiboImageView *weiboImageView;

@property (nonatomic, strong)WeiboView *reWeiboView;

@property (nonatomic, strong)Weibo *weibo;
@end
