//
//  Comment.m
//  微博登录
//
//  Created by tarena on 16/10/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Comment.h"
#import "YYTextView.h"
@implementation Comment
-(void)setSource:(NSString *)source{
    if (source.length>10) {
        source = [source componentsSeparatedByString:@">"][1];
        source = [[source componentsSeparatedByString:@"<"]firstObject];
    }
    
    _source = source;
    
    
}

-(NSString *)created_at{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    Fri Aug 28 16:34:36 +0800 2009
    //    EEE(星期) MMM(月) dd(日) HH:mm:ss Z(时区) yyyy(年)
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    NSDate *weiboDate = [formatter dateFromString:_created_at];
    //得到距1970年秒数
    long weiboTime = [weiboDate timeIntervalSince1970];
    //    得到当前时间距1970年秒数
    long nowTime = [[NSDate new] timeIntervalSince1970];
    long time = nowTime - weiboTime;
    //判断是否在1分钟内
    if (time<=60) {
        return @"刚刚";
    }else if (time>60&&time<=3600) {
        return [NSString stringWithFormat:@"%ld分钟前",time/60];
    }else if (time>3600&&time<=3600*24) {//判断一天内
        return [NSString stringWithFormat:@"%ld小时前",time/3600];
    }else{
        
        //        显示具体日期
        formatter.dateFormat = @"MM-dd";
        return [formatter stringFromDate:weiboDate];
    }
    
    
}

-(float)commentHeight{
    
    if (_commentHeight==0) {
        YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-2*8, 0)];
        
        tv.text = self.text;
        _commentHeight = tv.textLayout.textBoundingSize.height;
    }
    

    return _commentHeight;
}

@end
