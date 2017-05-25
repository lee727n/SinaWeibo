//
//  WeiboImageView.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "WeiboImageView.h"

@implementation WeiboImageView

-(void)setWeibo:(Weibo *)weibo{
    _weibo = weibo;
    
    for (UIImageView *iv in self.subviews) {
        [iv removeFromSuperview];
    }
    
    
    if (weibo.pic_urls.count==1) {
        UIImageView *iv =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kSW-2*kSpacing, 200)];
        
        NSDictionary *imageDic = weibo.pic_urls.firstObject;
        
        [self addSubview:iv];
        [iv setImageWithURL:[NSURL URLWithString: imageDic[@"thumbnail_pic"]]];
        
    }else{
        for (int i=0; i<weibo.pic_urls.count; i++) {
            UIImageView *iv =[[UIImageView alloc]initWithFrame:CGRectMake(i%3*(kImageSize+kSpacing), i/3*(kImageSize+kSpacing), kImageSize, kImageSize)];
            
            NSDictionary *imageDic = weibo.pic_urls[i];
            
            [self addSubview:iv];
            [iv setImageWithURL:[NSURL URLWithString: imageDic[@"thumbnail_pic"]]];
        }
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
