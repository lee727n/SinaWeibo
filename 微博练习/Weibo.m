//
//  Weibo.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "Weibo.h"
#import "YYTextView.h"
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

-(float)weiboHeight{
    
    float h = [self textHeight];
    if (self.pic_urls.count>0) {
        //加上图片高度
        h += [self imageHeight];
    }
    //判断是否有转发
    if (self.retweeted_status) {
        h += [self.retweeted_status weiboHeight];
    }
    
    return h;
}

-(float)textHeight{
    
    YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(0, 0, kSW-2*8,0)];
    
    tv.text = self.text;
    return tv.textLayout.textBoundingSize.height;
}

-(float)imageHeight{
    
    if (self.pic_urls.count==1) {
        return 200;
    }else if (self.pic_urls.count>1&&self.pic_urls.count<=3){//单行
        
        return kImageSize;
    }else if (self.pic_urls.count>3&&self.pic_urls.count<=6){//2行
        
        return 2*kImageSize+kSpacing;
    }else{//3行
        return 3*kImageSize+2*kSpacing;
    }
}



@end
