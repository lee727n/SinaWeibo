//
//  WeiboView.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "WeiboView.h"

@implementation WeiboView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textView = [[YYTextView alloc]initWithFrame:CGRectMake(kSpacing, 0, kSW-2*kSpacing, 0)];
        [self addSubview:self.textView];
//        self.textView.backgroundColor = [UIColor yellowColor];
//        self.backgroundColor = [UIColor greenColor];
        
        self.weiboImageView = [[WeiboImageView alloc]initWithFrame:CGRectMake(kSpacing, 0, kSW-2*kSpacing, 0)];
        [self addSubview:self.weiboImageView];
        
//        self.weiboImageView.backgroundColor = [UIColor blueColor];
        
        
        
       
        
        
        
    }
    return self;
}

-(void)setWeibo:(Weibo *)weibo{
    _weibo = weibo;
    
    //告诉控件显示内容
    self.textView.text = weibo.text;
    
    //更新控件的高度
    CGRect frame = self.textView.frame;
    frame.size.height = self.textView.textLayout.textBoundingSize.height;
    self.textView.frame = frame;
    
    //控制图片显示
//    一会儿在写
    self.weiboImageView.weibo = weibo;
    //控制图片的高度
    CGRect imageFrame = self.weiboImageView.frame;
    imageFrame.origin.y = CGRectGetMaxY(self.textView.frame);
    imageFrame.size.height = [weibo imageHeight];
    self.weiboImageView.frame = imageFrame;
    
    
 //如果有图片则显示图片控件 没有则不显示
    self.weiboImageView.hidden = weibo.pic_urls.count>0 ? NO : YES;
    
    
    
    
    //判断是否有转发
    if (weibo.retweeted_status) {
        if (!self.reWeiboView) {
            self.reWeiboView = [[WeiboView alloc]initWithFrame:CGRectMake(0, 0, kSW, 0)];
            [self addSubview:self.reWeiboView];
            self.reWeiboView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        }
        //控制显示
        self.reWeiboView.weibo = weibo.retweeted_status;
        CGRect frame = self.reWeiboView.frame;
        //设置转发微博View的y值
        frame.origin.y = CGRectGetMaxY(self.textView.frame);
        //设置转发微博View的高度
        frame.size.height = [weibo.retweeted_status weiboHeight];
        self.reWeiboView.frame = frame;
        self.reWeiboView.hidden = NO;
    }else{
        self.reWeiboView.hidden = YES;
    }
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
