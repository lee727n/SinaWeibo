//
//  Weibo.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

-(void)setSource:(NSString *)source{
    if ([source containsString:@">"]) {
          source = [source componentsSeparatedByString:@">"][1];
        _source = [source componentsSeparatedByString:@"<"].firstObject;
        
    }else _source = @"未知";
}







//    Fri Aug 28 16:34:36 +0800 2009
//    EEE(星期) MMM(月) dd(日) HH:mm:ss Z(时区) yyyy(年)

//时区 en_US
//如果得到的时间是字符串 需要把字符串时间转成NSDate对象 才能够和当前时间做比较

-(NSString *)created_at{
    
    NSDateFormatter *f = [NSDateFormatter new];
    f.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    //设置时区
    f.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    //得到发送微博的时间对象
    NSDate *createDate = [f dateFromString:_created_at];
    //得到当前时间对象
    NSDate *currentDate = [NSDate new];
    double createTime = [createDate timeIntervalSince1970];
    double currentTime = [currentDate timeIntervalSince1970];
    int time = currentTime-createTime;
    if (time<60) {//刚刚
        return @"刚刚";
    }else if (time>=60&&time<3600){
        return [NSString stringWithFormat:@"%d分钟前",time/60];
    }else if (time>=3600&&time<3600*24){
        return [NSString stringWithFormat:@"%d小时前",time/60/60];
    }else{//大于1天
        f.dateFormat = @"MM-dd HH:mm";
        
        return [f stringFromDate:createDate];
    }
    
    
    
    
}




@end
