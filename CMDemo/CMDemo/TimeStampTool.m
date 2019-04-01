//
//  TimeStampTool.m
//  CMDemo
//
//  Created by tianlong on 2019/3/15.
//  Copyright © 2019 tianlong. All rights reserved.
//

#import "TimeStampTool.h"

@implementation TimeStampTool
/**
 *时间戳字符串转日期
 @param timeStampstring 时间戳字符串，如@"14012455112"
 @return NSDate
 */
+(NSDate*)dateByTimeStampString:(NSString*)timeStampstring
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStampstring.floatValue];
    return date;
}

/**
 *时间戳串转日期
 @param timeStamp 时间戳字符串，如14012455112
 @return NSDate
 */
+(NSDate*)dateByTimeStamp:(NSTimeInterval)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return date;
}

/**
 *日期转时间戳字符串
 
 @param date NSDate
 @return 时间戳字符串，如@"14012455112"
 */
+(NSString*)timeStampStringByDate:(NSDate*)date
{
    NSInteger timeStamp = [date timeIntervalSince1970];
    NSString* timeStampString = [NSString stringWithFormat:@"%ld",(long)timeStamp];
    return timeStampString;
}

/**
 日期转时间戳
 
 @param date NSDate
 @return 14012455112
 */
+(NSTimeInterval)timeStampByDate:(NSDate*)date
{
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    return timeStamp;
}

/**
 时间戳字符串转年月日字符串
 
 @param style TTTimeStyle
 @param timeStampString @"14012455112"
 @return 2017-07-21 10:59:03
 */
+(NSString*)timeStyle:(TTTimeStyle)style timeStampString:(NSString*)timeStampString
{
    NSString* time = [self timeStyle:style timeStamp:timeStampString.floatValue];
    return time;
}

/**
 时间戳转年月日字符串
 
 @param style TTTimeStyle
 @param timeStamp 14012455112
 @return 2017-07-21
 */
+(NSString*)timeStyle:(TTTimeStyle)style timeStamp:(NSTimeInterval)timeStamp
{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSDate* date = [self dateByTimeStamp:timeStamp];
    NSString* time = [formatter stringFromDate:date];
    return time;
}

/**
 年月日字符串转时间戳字符串
 
 @param time TTTimeStyle
 @param style 2017-07-21
 @return @"14012455112"
 */
+(NSString*)timeStampStringByTime:(NSString *)time style:(TTTimeStyle)style
{
    NSDate* date = [self dateByTime:time style:style];
    NSString* timeStampString = [self timeStampStringByDate:date];
    return timeStampString;
}

/**
 年月日字符串转时间戳
 
 @param time 2017-07-21
 @param style TTTimeStyle
 @return 14012455112
 */
+(NSTimeInterval)timeStampByTime:(NSString *)time style:(TTTimeStyle)style
{
    NSString* timeStampString = [self timeStampStringByTime:time style:style];
    NSTimeInterval timeStamp = timeStampString.floatValue;
    return timeStamp;
}

/**
 年月日转日期
 
 @param time 2017-07-21
 @param style TTTimeStyle
 @return NSDate
 */
+(NSDate*)dateByTime:(NSString*)time style:(TTTimeStyle)style
{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSDate* date = [formatter dateFromString:time];
    return date;
}

/**
 日期转年月日
 
 @param date NSDate
 @param style TTTimeStyle
 @return 2017-07-21
 */
+(NSString*)timeByDate:(NSDate*)date style:(TTTimeStyle)style
{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSString* time = [formatter stringFromDate:date];
    return time;
}

#pragma mark - private helper
+(NSDateFormatter*)formatterWithStyle:(TTTimeStyle)style
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString* timeStyleString = nil;
    switch (style) {
            case TTTimeStyleComplete:
            timeStyleString = @"yyyy-MM-dd HH:mm:ss";
            break;
            case TTTimeStyleYearMonthDay:
            timeStyleString = @"yyyy-MM-dd";
            break;
            case TTTimeStyleYearMonthDayLine:
            timeStyleString = @"yyyy/MM/dd";
            break;
            
            case TTTimeStyleYearMonthDayDot:
            timeStyleString = @"yyyy.MM.dd";
            break;
            case TTTimeStyleYearMonth:
            timeStyleString = @"yyyy-MM";
            break;
            case TTTimeStyleChYearMonth:
            timeStyleString = @"yyyy年MM月";
            break;
            
            case TTTimeStyleYearMonthLine:
            timeStyleString = @"yyyy/MM";
            break;
            case TTTimeStyleMonthDay:
            timeStyleString = @"MM-dd";
            break;
            case TTTimeStyleYearMonthDayChinese:
            timeStyleString = @"yyyy年MM月dd日";
            break;
            case TTTimeStyleYearMonthDayHourMiniteDot:
            timeStyleString = @"yyyy.MM.dd HH:mm";
            break;
            case TTTimeStyleCNMonthDay:
            timeStyleString = @"MM月dd日";
            break;
        default:
            break;
    }
    [formatter setDateFormat:timeStyleString];
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return formatter;
}
@end
