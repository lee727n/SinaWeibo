//
//  CommentCell.m
//  微博登录
//
//  Created by tarena on 16/10/24.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.commentTV = [[YYTextView alloc]initWithFrame:CGRectMake(8, 70, self.bounds.size.width-2*8, 0)];
    [self.contentView addSubview:self.commentTV];
    
}

-(void)setComment:(Comment *)comment{
    _comment = comment;
    
    self.nickLabel.text = comment.user.screen_name;
    [self.headIV setImageWithURL:comment.user.avatar_large];
    
    self.timeLabel.text = comment.created_at;
    self.sourceLaebl.text = comment.source;
    
    
    
    self.commentTV.text = comment.text;
    
    CGRect frame = self.commentTV.frame;
    frame.size.height = [comment commentHeight];
    
    
    self.commentTV.frame = frame;
    
}



@end
