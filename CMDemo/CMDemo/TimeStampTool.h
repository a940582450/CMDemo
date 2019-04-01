//
//  TimeStampTool.h
//  CMDemo
//
//  Created by tianlong on 2019/3/15.
//  Copyright © 2019 tianlong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    TTTimeStyleComplete = 1,//2017-07-21 10:59:03
    TTTimeStyleYearMonthDay,//2017-07-21
    TTTimeStyleYearMonthDayLine,//2017/07/21
    TTTimeStyleYearMonthDayDot,//2017.07.21
    TTTimeStyleYearMonth,//2017-07
    TTTimeStyleChYearMonth,//2017年07月
    TTTimeStyleYearMonthLine,//2017/07
    TTTimeStyleMonthDay,//07-21
    TTTimeStyleYearMonthDayChinese, //2017年7月21日
    TTTimeStyleYearMonthDayHourMiniteDot,//2017.07.21 09:08
    TTTimeStyleCNMonthDay,//7月21日
}TTTimeStyle;
@interface TimeStampTool : NSObject
/**
 *时间戳字符串转日期
 @param timeStampstring 时间戳字符串，如@"14012455112"
 @return NSDate
 */
+(NSDate*)dateByTimeStampString:(NSString*)timeStampstring;

/**
 *时间戳串转日期
 @param timeStamp 时间戳字符串，如14012455112
 @return NSDate
 */
+(NSDate*)dateByTimeStamp:(NSTimeInterval)timeStamp;

/**
 *日期转时间戳字符串
 
 @param date NSDate
 @return 时间戳字符串，如@"14012455112"
 */
+(NSString*)timeStampStringByDate:(NSDate*)date;

/**
 日期转时间戳
 
 @param date NSDate
 @return 14012455112
 */
+(NSTimeInterval)timeStampByDate:(NSDate*)date;

/**
 时间戳字符串转年月日字符串
 
 @param style TTTimeStyle
 @param timeStampString @"14012455112"
 @return 2017-07-21 10:59:03
 */
+(NSString*)timeStyle:(TTTimeStyle)style timeStampString:(NSString*)timeStampString;

/**
 时间戳转年月日字符串
 
 @param style TTTimeStyle
 @param timeStamp 14012455112
 @return 2017-07-21
 */
+(NSString*)timeStyle:(TTTimeStyle)style timeStamp:(NSTimeInterval)timeStamp;

/**
 年月日字符串转时间戳字符串
 
 @param time TTTimeStyle
 @param style 2017-07-21
 @return @"14012455112"
 */
+(NSString*)timeStampStringByTime:(NSString *)time style:(TTTimeStyle)style;

/**
 年月日字符串转时间戳
 
 @param time 2017-07-21
 @param style TTTimeStyle
 @return 14012455112
 */
+(NSTimeInterval)timeStampByTime:(NSString *)time style:(TTTimeStyle)style;

/**
 年月日转日期
 
 @param time 2017-07-21
 @param style TTTimeStyle
 @return NSDate
 */
+(NSDate*)dateByTime:(NSString*)time style:(TTTimeStyle)style;

/**
 日期转年月日
 
 @param date NSDate
 @param style TTTimeStyle
 @return 2017-07-21
 */
+(NSString*)timeByDate:(NSDate*)date style:(TTTimeStyle)style;
@end
