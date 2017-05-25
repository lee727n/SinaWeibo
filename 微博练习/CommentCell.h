//
//  CommentCell.h
//  微博登录
//
//  Created by tarena on 16/10/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#import "YYTextView.h"
@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sourceLaebl;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (nonatomic, strong)Comment *comment;

@property (nonatomic, strong)YYTextView *commentTV;
@end
