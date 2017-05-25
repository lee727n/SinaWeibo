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
    
    
    
    
}

@end
