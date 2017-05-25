//
//  WeiboCell.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "WeiboCell.h"
#import "UIImageView+AFNetworking.h"
@implementation WeiboCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.weiboView = [[WeiboView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headIV.frame)+kSpacing, kSW, 0)];
    [self addSubview:self.weiboView];
    
}


-(void)setWeibo:(Weibo *)weibo{
    
    _weibo = weibo;
    
    self.nickLabel.text = weibo.user.screen_name;
    [self.headIV setImageWithURL:weibo.user.avatar_large];
    self.timeLabel.text = weibo.created_at;
    self.sourceLabel.text = weibo.source;
    [self.commentBtn setTitle:weibo.comments_count forState:UIControlStateNormal];
    [self.likeBtn setTitle:weibo.attitudes_count forState:UIControlStateNormal];
    [self.repostBtn setTitle:weibo.reposts_count forState:UIControlStateNormal];
    
    NSLog(@"%@    %@ ",weibo.created_at,weibo.source);
    
    //把模型数据交给自定义weiboView
    self.weiboView.weibo = weibo;
  //更新控件的高度
    CGRect frame = self.weiboView.frame;
    frame.size.height = [weibo weiboHeight];
    self.weiboView.frame = frame;

    
    
    
    
}

@end
