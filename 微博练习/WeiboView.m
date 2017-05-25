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
        self.textView.backgroundColor = [UIColor yellowColor];
        self.backgroundColor = [UIColor greenColor];
        
        self.weiboImageView = [[WeiboImageView alloc]initWithFrame:CGRectMake(kSpacing, 0, kSW-2*kSpacing, 0)];
        [self addSubview:self.weiboImageView];
        
        self.weiboImageView.backgroundColor = [UIColor blueColor];
        
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
    //控制图片的高度
    CGRect imageFrame = self.weiboImageView.frame;
    imageFrame.origin.y = CGRectGetMaxY(self.textView.frame);
    imageFrame.size.height = [weibo imageHeight];
    self.weiboImageView.frame = imageFrame;
    
    
 //如果有图片则显示图片控件 没有则不显示
    self.weiboImageView.hidden = weibo.pic_urls.count>0 ? NO : YES;
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
